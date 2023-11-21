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
  source = "github.com/osinfra-io/terraform-google-cloud-nat//regional?ref=v0.1.0"

  network = local.global.vpc_name
  project = local.global.project_id
  region  = var.region

  depends_on = [
    module.subnet
  ]
}

# Google Subnet Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-subnet

module "subnet" {
  source = "github.com/osinfra-io/terraform-google-subnet//regional?ref=v0.1.0"

  for_each = var.subnets

  ip_cidr_range = each.value.ip_cidr_range
  name          = "${each.key}-${var.region}"
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
      range_name    = "services-k8s-services-${var.region}"
      ip_cidr_range = each.value.services_ip_cidr_range
    },
    {
      range_name    = "service-k8s-pods-${var.region}"
      ip_cidr_range = each.value.pod_ip_cidr_range
    }
  ]
}

# Compute Subnetwork IAM Member Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork_iam

resource "google_compute_subnetwork_iam_member" "cloud_services" {
  for_each = var.kubernetes_service_projects

  member     = "serviceAccount:${each.key}@cloudservices.gserviceaccount.com"
  project    = local.global.project_id
  region     = var.region
  role       = "roles/compute.networkUser"
  subnetwork = "services-${var.region}"

  depends_on = [
    module.subnet
  ]
}

resource "google_compute_subnetwork_iam_member" "container_engine" {
  for_each = var.kubernetes_service_projects

  member     = "serviceAccount:service-${each.key}@container-engine-robot.iam.gserviceaccount.com"
  project    = local.global.project_id
  region     = var.region
  role       = "roles/compute.networkUser"
  subnetwork = "services-${var.region}"

  depends_on = [
    module.subnet
  ]
}
