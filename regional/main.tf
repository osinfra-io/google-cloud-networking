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
    prefix = "google-cloud-networking"
  }

  workspace = "global-${var.environment}"
}

# Google Cloud NAT Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-cloud-nat

module "cloud_nat" {
  source = "github.com/osinfra-io/terraform-google-network//regional/nat?ref=v0.1.0"

  network = local.global.vpc_name
  project = local.global.project_id
  region  = var.region

  depends_on = [
    module.subnets
  ]
}

# Google Subnet Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-subnet

module "subnets" {
  source = "github.com/osinfra-io/terraform-google-network//regional?ref=v0.1.0"

  for_each = var.subnets

  ip_cidr_range = each.value.ip_cidr_range
  name          = each.key
  network       = local.global.vpc_name

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
      range_name    = "k8s-secondary-services"
      ip_cidr_range = each.value.services_ip_cidr_range
    },
    {
      range_name    = "k8s-secondary-pods"
      ip_cidr_range = each.value.pod_ip_cidr_range
    }
  ]
}

# Compute Subnetwork IAM Member Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork_iam

resource "google_compute_subnetwork_iam_member" "cloud_services" {
  for_each = var.subnets

  member     = "serviceAccount:${each.value.service_project_number}@cloudservices.gserviceaccount.com"
  project    = local.global.project_id
  region     = var.region
  role       = "roles/compute.networkUser"
  subnetwork = module.subnets[each.key].name
}

resource "google_compute_subnetwork_iam_member" "container_engine" {
  for_each = var.subnets

  member     = "serviceAccount:service-${each.value.service_project_number}@container-engine-robot.iam.gserviceaccount.com"
  project    = local.global.project_id
  region     = var.region
  role       = "roles/compute.networkUser"
  subnetwork = module.subnets[each.key].name
}
