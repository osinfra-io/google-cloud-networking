variable "environment" {
  description = "The environment suffix for example: `sb` (Sandbox), `nonprod` (Non-Production), `prod` (Production)"
  type        = string
  default     = "sb"
}

variable "ip_cidr_range" {
  description = "The range of internal addresses that are owned by this subnetwork"
  type        = string
}

variable "region" {
  description = "The region for this subnetwork"
  type        = string
}

variable "remote_bucket" {
  type        = string
  description = "The remote bucket the `terraform_remote_state` data source retrieves the state from"
}

variable "subnets" {
  description = "The map of subnets to create"
  type = map(object({
    ip_cidr_range          = string
    master_ip_cidr_range   = string
    pod_ip_cidr_range      = string
    services_ip_cidr_range = string
  }))
}
