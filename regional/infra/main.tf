# Required Providers
# https://www.terraform.io/docs/language/providers/requirements.html#requiring-providers

terraform {
  required_providers {

    # Google Cloud Provider
    # https://www.terraform.io/docs/providers/google/index.html

    google = {
      source = "hashicorp/google"
    }
  }
}

# Terraform Remote State Datasource
# https://www.terraform.io/docs/language/state/remote-state-data.html

data "terraform_remote_state" "global" {
  backend = "gcs"

  config = {
    bucket = var.remote_bucket
    prefix = "google-cloud-services"
  }

  workspace = "global-${var.environment}"
}

module "subnet" {
  source = "github.com/osinfra-io/terraform-google-subnet//regional?ref=v0.1.0"

  ip_cidr_range = "10.60.0.0/20"
  name          = "services-${var.region}"
  network       = "services"

  # When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and
  # services by using Private Google Access. This is required for private Kubernetes clusters.

  private_ip_google_access = true
  project                  = local.global.project_id
  region                   = var.region

  # Secondary ranges are used to allocate IP addresses to resources in a subnetwork. In this example we create Pod IP address ranges
  # and Service (ClusterIP) address ranges for a VPC-native cluster.

  # https://cloud.google.com/kubernetes-engine/docs/concepts/alias-ips

  secondary_ip_ranges = [
    {
      range_name    = "services-k8s-services-${var.region}"
      ip_cidr_range = "10.60.240.0/20"
    },
    {
      range_name    = "service-k8s-pods-${var.region}"
      ip_cidr_range = "10.0.0.0/14"
    }
  ]
}
