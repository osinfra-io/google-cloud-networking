# Local Values
# https://www.terraform.io/docs/language/values/locals.html

locals {
  domain_environment = var.environment == "prod" ? "" : var.environment
  env                = var.environment == "sandbox" ? "sb" : var.environment == "non-production" ? "non-prod" : var.environment == "production" ? "prod" : "none"

  labels = {
    cost-center = "x001"
    env         = var.environment
    repository  = "google-cloud-networking"
    platform    = "google-cloud-landing-zone"
    team        = "platform-google-cloud-landing-zone"
  }
}
