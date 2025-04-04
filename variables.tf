# Input Variables
# https://www.terraform.io/language/values/variables

variable "datadog_api_key" {
  description = "Datadog API key"
  type        = string
  sensitive   = true
}

variable "datadog_app_key" {
  description = "Datadog APP key"
  type        = string
  sensitive   = true
}

variable "datadog_enable" {
  description = "Enable Datadog integration"
  type        = bool
  default     = false
}

variable "dns_records_admins" {
  description = "The set of service accounts that can administer DNS records in this project"
  type        = set(string)
  default     = []
}

variable "iam_admins" {
  description = "The set of service accounts that can administer IAM in this project"
  type        = set(string)
  default     = []
}

variable "private_record_sets" {
  description = "Private DNS record sets"
  type = list(object({
    name    = string
    rrdatas = list(string)
    type    = string
    ttl     = number
  }))
  default = []
}

variable "project_billing_account" {
  description = "The alphanumeric ID of the billing account this project belongs to"
  type        = string
  default     = "01C550-A2C86B-B8F16B"
}

variable "project_cis_2_2_logging_sink_project_id" {
  description = "The CIS 2.2 logging sink benchmark project ID"
  type        = string
}

variable "project_folder_id" {
  description = "The numeric ID of the folder this project should be created under. Only one of `org_id` or `folder_id` may be specified"
  type        = string
}

variable "public_record_sets" {
  description = "Private DNS record sets"
  type = list(object({
    name    = string
    rrdatas = list(string)
    type    = string
    ttl     = number
  }))
  default = []
}

variable "vpc_service_projects" {
  description = "The map of Kubernetes service project IDs and numbers (The number should only be added if the project is a Kubernetes service project)"
  type = map(object({
    number = optional(number)
  }))
  default = {}
}
