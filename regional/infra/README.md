# Terraform Regional Infrastructure Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.18.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloud_nat"></a> [cloud\_nat](#module\_cloud\_nat) | github.com/osinfra-io/terraform-google-cloud-nat//regional | v0.1.0 |
| <a name="module_subnet"></a> [subnet](#module\_subnet) | github.com/osinfra-io/terraform-google-subnet//regional | v0.1.0 |

## Resources

| Name | Type |
|------|------|
| [google_compute_subnetwork_iam_member.cloud_services](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork_iam_member) | resource |
| [google_compute_subnetwork_iam_member.container_engine](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork_iam_member) | resource |
| [terraform_remote_state.global](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The environment for example: `sandbox`, `non-production`, `production` | `string` | `"sandbox"` | no |
| <a name="input_kubernetes_service_projects"></a> [kubernetes\_service\_projects](#input\_kubernetes\_service\_projects) | The map of Kubernetes service project IDs and numbers | <pre>map(object({<br>    number = optional(number)<br>  }))</pre> | `{}` | no |
| <a name="input_region"></a> [region](#input\_region) | The region for this subnetwork | `string` | n/a | yes |
| <a name="input_remote_bucket"></a> [remote\_bucket](#input\_remote\_bucket) | The remote bucket the `terraform_remote_state` data source retrieves the state from | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | The map of subnets to create | <pre>map(object({<br>    ip_cidr_range          = string<br>    master_ip_cidr_range   = string<br>    pod_ip_cidr_range      = string<br>    services_ip_cidr_range = string<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
