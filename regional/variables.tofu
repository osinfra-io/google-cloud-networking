variable "remote_bucket" {
  type        = string
  description = "The remote bucket the `terraform_remote_state` data source retrieves the state from"
}

# These three state_* variables are required for early variable evaluation for backend and provider configuration.
# They are defined in the GitHub Actions called workflows and should NOT be set in the OpenTofu configuration.

variable "state_bucket" {
  description = "The name of the GCS bucket to store state files"
  type        = string
}

variable "state_kms_encryption_key" {
  description = "The KMS encryption key for state and plan files"
  type        = string
}

variable "state_prefix" {
  description = "The prefix for state files in the GCS bucket"
  type        = string
}

variable "subnets" {
  description = "The map of subnets to create"
  type = map(object({
    ip_cidr_range          = string
    service_project_number = string
    pod_ip_cidr_range      = string
    services_ip_cidr_range = string
  }))
}
