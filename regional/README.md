# OpenTofu Documentation

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.19.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloud_nat"></a> [cloud\_nat](#module\_cloud\_nat) | github.com/osinfra-io/opentofu-google-network//regional/nat | v0.2.1 |
| <a name="module_helpers"></a> [helpers](#module\_helpers) | github.com/osinfra-io/opentofu-core-helpers//root | v0.1.2 |
| <a name="module_subnets"></a> [subnets](#module\_subnets) | github.com/osinfra-io/opentofu-google-network//regional | v0.2.1 |

## Resources

| Name | Type |
|------|------|
| [google_compute_subnetwork_iam_member.cloud_services](https://search.opentofu.org/provider/hashicorp/google/latest/docs/resources/compute_subnetwork_iam_member) | resource |
| [google_compute_subnetwork_iam_member.container_engine](https://search.opentofu.org/provider/hashicorp/google/latest/docs/resources/compute_subnetwork_iam_member) | resource |
| [terraform_remote_state.main](https://search.opentofu.org/provider/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_remote_bucket"></a> [remote\_bucket](#input\_remote\_bucket) | The remote bucket the `terraform_remote_state` data source retrieves the state from | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | The map of subnets to create | <pre>map(object({<br/>    ip_cidr_range          = string<br/>    service_project_number = string<br/>    pod_ip_cidr_range      = string<br/>    services_ip_cidr_range = string<br/>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
