# Required Providers
# https://opentofu.org/docs/language/providers/requirements#requiring-providers

terraform {
  # State and Plan Encryption
  # https://opentofu.org/docs/language/state/encryption

  # The commented out sections below demonstrate how to configure
  # fallback encryption methods for state and plan files for bootstrapping.

  encryption {
    method "unencrypted" "migrate" {}

    key_provider "gcp_kms" "default" {
      kms_encryption_key = var.state_kms_encryption_key
      key_length         = 32
    }

    method "aes_gcm" "default" {
      keys = key_provider.gcp_kms.default
    }

    plan {
      method = method.aes_gcm.default
      # enforced = true

      fallback {
        method = method.unencrypted.migrate
      }
    }

    remote_state_data_sources {
      default {
        method = method.aes_gcm.default
      }
    }

    state {
      method = method.aes_gcm.default
      # enforced = true

      fallback {
        method = method.unencrypted.migrate
      }
    }
  }

  required_providers {

    # Google Cloud Provider
    # https://search.opentofu.org/provider/hashicorp/google/latest/docs

    google = {
      source = "hashicorp/google"
    }
  }
}

# OpenTofu Remote State Datasource
# https://opentofu.org/docs/language/state/remote-state-data/

data "terraform_remote_state" "main" {
  backend = "gcs"

  config = {
    bucket             = var.remote_bucket
    kms_encryption_key = var.state_kms_encryption_key
    prefix             = "google-cloud-networking"
  }

  workspace = "main-${module.helpers.environment}"
}

# Google Cloud NAT Module (osinfra.io)
# https://github.com/osinfra-io/opentofu-google-cloud-nat

module "cloud_nat" {
  source = "github.com/osinfra-io/opentofu-google-network//regional/nat?ref=v0.2.3"

  network = local.main.vpc_name
  project = local.main.project_id

  depends_on = [
    module.subnets
  ]
}

# Google Subnet Module (osinfra.io)
# https://github.com/osinfra-io/opentofu-google-subnet

module "subnets" {
  source = "github.com/osinfra-io/opentofu-google-network//regional?ref=v0.2.3"

  for_each = var.subnets

  ip_cidr_range = each.value.ip_cidr_range
  name          = each.key
  network       = local.main.vpc_name

  # When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and
  # services by using Private Google Access. This is required for private Kubernetes clusters.

  private_ip_google_access = true
  project                  = local.main.project_id

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
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/resources/compute_subnetwork_iam

resource "google_compute_subnetwork_iam_member" "cloud_services" {
  for_each = var.subnets

  member     = "serviceAccount:${each.value.service_project_number}@cloudservices.gserviceaccount.com"
  project    = local.main.project_id
  region     = module.helpers.region
  role       = "roles/compute.networkUser"
  subnetwork = module.subnets[each.key].name
}

resource "google_compute_subnetwork_iam_member" "container_engine" {
  for_each = var.subnets

  member     = "serviceAccount:service-${each.value.service_project_number}@container-engine-robot.iam.gserviceaccount.com"
  project    = local.main.project_id
  region     = module.helpers.region
  role       = "roles/compute.networkUser"
  subnetwork = module.subnets[each.key].name
}

resource "null_resource" "force_apply" {
  triggers = {
    always_run = timestamp()
  }
}
