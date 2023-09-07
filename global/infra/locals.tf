# Local Values
# https://www.terraform.io/docs/language/values/locals.html

locals {
  domain_environment = var.environment == "prod" ? "" : var.environment
}
