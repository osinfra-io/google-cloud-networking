terraform {

  # Requiring Providers
  # https://www.terraform.io/language/providers/requirements#requiring-providers

  required_providers {

    # Google Cloud Platform Provider
    # https://registry.terraform.io/providers/hashicorp/google/latest/docs

    google = {
      source = "hashicorp/google"
    }
  }
}

# Google Project Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-project

module "project" {
  source = "github.com/osinfra-io/terraform-google-project?ref=v0.1.2"

  billing_account                 = var.billing_account
  cis_2_2_logging_sink_project_id = var.cis_2_2_logging_sink_project_id
  cost_center                     = "x001"
  description                     = "networking"
  environment                     = local.environment_short
  folder_id                       = var.folder_id

  labels = {
    env      = var.environment
    module   = "google-cloud-networking"
    platform = "google-cloud-landing-zone"
    team     = "platform-google-cloud-landing-zone"
  }

  prefix = "plt-lz"

  services = [
    "dns.googleapis.com"
  ]
}

# Google Cloud DNS Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-cloud-dns

module "private_dns" {
  source = "github.com/osinfra-io/terraform-google-cloud-dns//global?ref=v0.1.0"

  dns_name = var.environment == "production" ? "gcp-priv.osinfra.io." : "${local.environment_short}.gcp-priv.osinfra.io."

  labels = {
    env         = var.environment
    cost-center = "x001"
    module      = "google-cloud-networking"
    platform    = "google-cloud-landing-zone"
    team        = "platform-google-cloud-landing-zone"
  }

  name = var.environment == "production" ? "gcp-priv-osinfra-io" : "${local.environment_short}-gcp-priv-osinfra-io"

  private_visibility_config_networks = [
    module.vpc.self_link
  ]

  project    = module.project.project_id
  visibility = "private"
}

module "public_dns" {
  source = "github.com/osinfra-io/terraform-google-cloud-dns//global?ref=v0.1.0"

  dns_name = var.environment == "production" ? "gcp.osinfra.io." : "${local.environment_short}.gcp.osinfra.io."

  labels = {
    env         = var.environment
    cost-center = "x001"
    module      = "google-cloud-networking"
    platform    = "google-cloud-landing-zone"
    team        = "platform-google-cloud-landing-zone"
  }

  name       = var.environment == "production" ? "gcp-osinfra-io" : "${local.environment_short}-gcp-osinfra-io"
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
