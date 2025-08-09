# Output Values
# https://opentofu.org/docs/language/values/outputs

output "vpc_name" {
  description = "The VPC name"
  value       = module.vpc.name
}

output "project_id" {
  description = "The project ID"
  value       = module.project.id
}
