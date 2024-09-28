# Local Values
# https://www.terraform.io/docs/language/values/locals.html

locals {
  domain_environment = var.environment == "prod" ? "" : var.environment
  env                = lookup(local.env_map, var.environment, "none")

  env_map = {
    "non-production" = "nonprod"
    "production"     = "prod"
    "sandbox"        = "sb"
  }

  labels = {
    cost-center = "x001"
    env         = var.environment
    repository  = "google-cloud-networking"
    platform    = "google-cloud-landing-zone"
    team        = "platform-google-cloud-landing-zone"
  }
}
