# Terraform Global Infrastructure Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.69.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_private_dns"></a> [private\_dns](#module\_private\_dns) | github.com/osinfra-io/terraform-google-cloud-dns//global | v0.1.0 |
| <a name="module_project"></a> [project](#module\_project) | github.com/osinfra-io/terraform-google-project | v0.1.1 |
| <a name="module_public_dns"></a> [public\_dns](#module\_public\_dns) | github.com/osinfra-io/terraform-google-cloud-dns//global | v0.1.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | github.com/osinfra-io/terraform-google-vpc//global | v0.1.0 |

## Resources

| Name | Type |
|------|------|
| [google_compute_shared_vpc_host_project.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_shared_vpc_host_project) | resource |
| [google_compute_shared_vpc_service_project.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_shared_vpc_service_project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The alphanumeric ID of the billing account this project belongs to | `string` | n/a | yes |
| <a name="input_cis_2_2_logging_sink_project_id"></a> [cis\_2\_2\_logging\_sink\_project\_id](#input\_cis\_2\_2\_logging\_sink\_project\_id) | The CIS 2.2 logging sink benchmark project ID | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment for example: `sandbox`, `non-production`, `production` | `string` | `"sandbox"` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The numeric ID of the folder this project should be created under. Only one of `org_id` or `folder_id` may be specified | `string` | n/a | yes |
| <a name="input_shared_vpc_service_projects"></a> [shared\_vpc\_service\_projects](#input\_shared\_vpc\_service\_projects) | The set of service projects to attach to the shared VPC | `set(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | The project ID |
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name) | The VPC name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
