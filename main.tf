terraform {

  # Requiring Providers
  # https://www.terraform.io/language/providers/requirements#requiring-providers

  required_providers {

    # Datadog Provider
    # https://registry.terraform.io/providers/DataDog/datadog/latest/docs

    datadog = {
      source = "datadog/datadog"
    }

    # Google Cloud Platform Provider
    # https://registry.terraform.io/providers/hashicorp/google/latest/docs

    google = {
      source = "hashicorp/google"
    }
  }
}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}

# Datadog Google Cloud Platform Integration Module (osinfra.io)
# https://github.com/osinfra-io/terraform-datadog-google-integration

module "datadog" {
  source = "github.com/osinfra-io/terraform-datadog-google-integration?ref=v0.3.5"
  count  = var.datadog_enable ? 1 : 0

  api_key = var.datadog_api_key
  labels  = module.helpers.labels
  project = module.project.id
}

# Google Project Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-project

module "project" {
  source = "github.com/osinfra-io/terraform-google-project?ref=v0.4.5"

  billing_account                 = var.project_billing_account
  cis_2_2_logging_sink_project_id = var.project_cis_2_2_logging_sink_project_id
  description                     = "networking"
  folder_id                       = var.project_folder_id
  labels                          = module.helpers.labels
  prefix                          = "plt-lz"

  services = [
    "cloudasset.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "dns.googleapis.com",
    "iam.googleapis.com",
    "monitoring.googleapis.com",
    "securitycenter.googleapis.com",
    "servicenetworking.googleapis.com"
  ]
}

# Google Cloud DNS Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-cloud-dns

module "private_dns" {
  source = "github.com/osinfra-io/terraform-google-network//dns?ref=v0.2.1"

  dns_name = module.helpers.env == "prod" ? "gcp-priv.osinfra.io." : "${module.helpers.env}.gcp-priv.osinfra.io."
  labels   = module.helpers.labels
  name     = module.helpers.env == "prod" ? "gcp-priv-osinfra-io" : "${module.helpers.env}-gcp-priv-osinfra-io"

  private_visibility_config_networks = [
    module.vpc.self_link
  ]

  project    = module.project.id
  visibility = "private"
}

module "public_dns" {
  # Ensure that DNSSEC is enabled for Cloud DNS
  # checkov:skip=CKV_GCP_16: False positive

  source = "github.com/osinfra-io/terraform-google-network//dns?ref=v0.2.1"

  dns_name   = module.helpers.env == "prod" ? "gcp.osinfra.io." : "${module.helpers.env}.gcp.osinfra.io."
  labels     = module.helpers.labels
  name       = module.helpers.env == "prod" ? "gcp-osinfra-io" : "${module.helpers.env}-gcp-osinfra-io"
  project    = module.project.id
  visibility = "public"
}

# Google VPC Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-vpc

module "vpc" {
  source = "github.com/osinfra-io/terraform-google-network?ref=v0.2.2"

  name       = "standard-shared"
  project    = module.project.id
  shared_vpc = true
}

# Compute Global Address Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address

resource "google_compute_global_address" "service_network_peering_range" {
  address       = "172.16.0.0"
  address_type  = "INTERNAL"
  labels        = module.helpers.labels
  name          = "service-network-peering-range"
  network       = module.vpc.self_link
  prefix_length = 16
  project       = module.project.id
  purpose       = "VPC_PEERING"
}

# Compute Shared VPC Service Project Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_shared_vpc_service_project

resource "google_compute_shared_vpc_service_project" "this" {
  for_each = var.vpc_service_projects

  host_project    = module.project.id
  service_project = each.key
}

# DNS Record Set Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_record_set

resource "google_dns_record_set" "private" {
  for_each = { for record in var.private_record_sets : join("-", [record.name, lower(record.type)]) => record }

  managed_zone = module.private_dns.name
  name         = "${each.value.name}.${module.private_dns.dns_name}"
  project      = module.project.id
  rrdatas      = each.value.rrdatas
  ttl          = each.value.ttl
  type         = each.value.type
}

resource "google_dns_record_set" "public" {
  for_each = { for record in var.public_record_sets : join("-", [record.name, lower(record.type)]) => record }

  managed_zone = module.public_dns.name
  name         = "${each.value.name}.${module.public_dns.dns_name}"
  project      = module.project.id
  rrdatas      = each.value.rrdatas
  ttl          = each.value.ttl
  type         = each.value.type
}

# Project IAM Member Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam_member

resource "google_project_iam_member" "container_engine_firewall_management" {
  for_each = { for k, v in var.vpc_service_projects : k => v if lookup(v, "number", null) != null }

  member  = "serviceAccount:service-${lookup(each.value, "number")}@container-engine-robot.iam.gserviceaccount.com"
  project = module.project.id
  role    = "organizations/163313809793/roles/kubernetes.hostFirewallManagement"
}

resource "google_project_iam_member" "container_engine_service_agent_user" {
  for_each = { for k, v in var.vpc_service_projects : k => v if lookup(v, "number", null) != null }

  member  = "serviceAccount:service-${lookup(each.value, "number")}@container-engine-robot.iam.gserviceaccount.com"
  project = module.project.id
  role    = "roles/container.hostServiceAgentUser"
}

resource "google_project_iam_member" "dns_records_admins" {
  for_each = var.dns_records_admins

  member  = "serviceAccount:${each.key}"
  project = module.project.id
  role    = "organizations/163313809793/roles/dns.recordsAdmin"
}

resource "google_project_iam_member" "iam_admins" {
  for_each = var.iam_admins

  member  = "serviceAccount:${each.key}"
  project = module.project.id
  role    = "roles/resourcemanager.projectIamAdmin"
}

# Service Networking Connection Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection

resource "google_service_networking_connection" "this" {
  network                 = module.vpc.self_link
  reserved_peering_ranges = [google_compute_global_address.service_network_peering_range.name]
  service                 = "servicenetworking.googleapis.com"
}
