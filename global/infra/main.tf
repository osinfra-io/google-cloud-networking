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
  source = "github.com/osinfra-io/terraform-google-project//global?ref=v0.1.4"

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
    "iam.googleapis.com",
    "monitoring.googleapis.com",
    "dns.googleapis.com"
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
