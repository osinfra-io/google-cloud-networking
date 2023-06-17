# Local Values
# https://www.terraform.io/docs/language/values/locals.html

locals {
  environment_short = var.environment == "production" ? "prod" : var.environment == "non-production" ? "nonprod" : "sb"
}
