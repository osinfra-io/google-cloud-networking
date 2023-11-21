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

# module "datadog" {
#   source = "github.com/osinfra-io/terraform-datadog-google-integration//global?ref=v0.1.0"

#   api_key         = var.datadog_api_key
#   is_cspm_enabled = true
#   project         = module.project.project_id
# }

# Google Project Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-project

module "project" {
  source = "github.com/osinfra-io/terraform-google-project//global?ref=v0.1.7"

  billing_account                 = var.billing_account
  cis_2_2_logging_sink_project_id = var.cis_2_2_logging_sink_project_id
  cost_center                     = "x001"
  description                     = "networking"
  environment                     = var.environment
  folder_id                       = var.folder_id

  labels = {
    env      = var.environment
    module   = "google-cloud-networking"
    platform = "google-cloud-landing-zone"
    team     = "platform-google-cloud-landing-zone"
  }

  prefix = "plt-lz"

  services = [
    "cloudasset.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "dns.googleapis.com",
    "iam.googleapis.com",
    "monitoring.googleapis.com",
    "servicenetworking.googleapis.com"
  ]
}

# Google Cloud DNS Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-cloud-dns

module "private_dns" {
  source = "github.com/osinfra-io/terraform-google-cloud-dns//global?ref=v0.1.0"

  dns_name = var.environment == "prod" ? "gcp-priv.osinfra.io." : "${var.environment}.gcp-priv.osinfra.io."

  labels = {
    env         = var.environment
    cost-center = "x001"
    module      = "google-cloud-networking"
    platform    = "google-cloud-landing-zone"
    team        = "platform-google-cloud-landing-zone"
  }

  name = var.environment == "prod" ? "gcp-priv-osinfra-io" : "${var.environment}-gcp-priv-osinfra-io"

  private_visibility_config_networks = [
    module.vpc.self_link
  ]

  project    = module.project.project_id
  visibility = "private"
}

module "public_dns" {
  source = "github.com/osinfra-io/terraform-google-cloud-dns//global?ref=v0.1.0"

  dns_name = var.environment == "prod" ? "gcp.osinfra.io." : "${var.environment}.gcp.osinfra.io."

  labels = {
    env         = var.environment
    cost-center = "x001"
    module      = "google-cloud-networking"
    platform    = "google-cloud-landing-zone"
    team        = "platform-google-cloud-landing-zone"
  }

  name       = var.environment == "prod" ? "gcp-osinfra-io" : "${var.environment}-gcp-osinfra-io"
  project    = module.project.project_id
  visibility = "public"
}

# Google VPC Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-vpc

module "vpc" {
  source = "github.com/osinfra-io/terraform-google-vpc//global?ref=v0.1.1"

  name       = "standard-shared"
  project    = module.project.project_id
  shared_vpc = true
}

# Compute Global Address Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address

resource "google_compute_global_address" "service_network_peering_range" {
  address       = "172.16.0.0"
  address_type  = "INTERNAL"
  name          = "service-network-peering-range"
  network       = module.vpc.self_link
  prefix_length = 16
  project       = module.project.project_id
  purpose       = "VPC_PEERING"
}

# Project IAM Member Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam_member

resource "google_project_iam_member" "container_engine_firewall_management" {
  for_each = var.kubernetes_service_projects

  member  = "serviceAccount:service-${each.key}@container-engine-robot.iam.gserviceaccount.com"
  project = module.project.project_id
  role    = "organizations/163313809793/roles/kubernetes.hostFirewallManagement"
}

resource "google_project_iam_member" "container_engine_service_agent_user" {
  for_each = var.kubernetes_service_projects

  member  = "serviceAccount:service-${each.key}@container-engine-robot.iam.gserviceaccount.com"
  project = module.project.project_id
  role    = "roles/container.hostServiceAgentUser"
}

# Service Networking Connection Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection

resource "google_service_networking_connection" "this" {
  network                 = module.vpc.self_link
  reserved_peering_ranges = [google_compute_global_address.service_network_peering_range.name]
  service                 = "servicenetworking.googleapis.com"
}
