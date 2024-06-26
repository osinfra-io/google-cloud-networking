# Terraform Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.28.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_datadog"></a> [datadog](#module\_datadog) | github.com/osinfra-io/terraform-datadog-google-integration//global | v0.1.5 |
| <a name="module_private_dns"></a> [private\_dns](#module\_private\_dns) | github.com/osinfra-io/terraform-google-cloud-dns//global | v0.1.1 |
| <a name="module_project"></a> [project](#module\_project) | github.com/osinfra-io/terraform-google-project//global | v0.2.1 |
| <a name="module_public_dns"></a> [public\_dns](#module\_public\_dns) | github.com/osinfra-io/terraform-google-cloud-dns//global | v0.1.1 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | github.com/osinfra-io/terraform-google-vpc//global | v0.1.1 |

## Resources

| Name | Type |
|------|------|
| [google_compute_global_address.service_network_peering_range](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_compute_shared_vpc_service_project.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_shared_vpc_service_project) | resource |
| [google_dns_record_set.private](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_record_set) | resource |
| [google_dns_record_set.public](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_record_set) | resource |
| [google_project_iam_member.container_engine_firewall_management](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.container_engine_service_agent_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.dns_records_admins](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_networking_connection.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The alphanumeric ID of the billing account this project belongs to | `string` | `"01C550-A2C86B-B8F16B"` | no |
| <a name="input_cis_2_2_logging_sink_project_id"></a> [cis\_2\_2\_logging\_sink\_project\_id](#input\_cis\_2\_2\_logging\_sink\_project\_id) | The CIS 2.2 logging sink benchmark project ID | `string` | n/a | yes |
| <a name="input_datadog_api_key"></a> [datadog\_api\_key](#input\_datadog\_api\_key) | Datadog API key | `string` | n/a | yes |
| <a name="input_datadog_app_key"></a> [datadog\_app\_key](#input\_datadog\_app\_key) | Datadog APP key | `string` | n/a | yes |
| <a name="input_dns_records_admins"></a> [dns\_records\_admins](#input\_dns\_records\_admins) | The set of service accounts that can administer DNS records in this project | `set(string)` | `[]` | no |
| <a name="input_enable_datadog"></a> [enable\_datadog](#input\_enable\_datadog) | Enable Datadog integration | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment suffix for example: `sb` (Sandbox), `nonprod` (Non-Production), `prod` (Production) | `string` | `"sb"` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The numeric ID of the folder this project should be created under. Only one of `org_id` or `folder_id` may be specified | `string` | n/a | yes |
| <a name="input_private_record_sets"></a> [private\_record\_sets](#input\_private\_record\_sets) | Private DNS record sets | <pre>list(object({<br>    name    = string<br>    rrdatas = list(string)<br>    type    = string<br>    ttl     = number<br>  }))</pre> | `[]` | no |
| <a name="input_public_record_sets"></a> [public\_record\_sets](#input\_public\_record\_sets) | Private DNS record sets | <pre>list(object({<br>    name    = string<br>    rrdatas = list(string)<br>    type    = string<br>    ttl     = number<br>  }))</pre> | `[]` | no |
| <a name="input_vpc_service_projects"></a> [vpc\_service\_projects](#input\_vpc\_service\_projects) | The map of Kubernetes service project IDs and numbers (The number should only be added if the project is a Kubernetes service project) | <pre>map(object({<br>    number = optional(number)<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | The project ID |
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name) | The VPC name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
