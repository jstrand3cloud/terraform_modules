## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_account.storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Region in which to deploy these resources | `string` | `"eastus"` | no |
| <a name="input_sftp_enabled"></a> [sftp\_enabled](#input\_sftp\_enabled) | Boolean, enable SFTP for the storage account | `string` | `false` | no |
| <a name="input_storage_account_access_tier"></a> [storage\_account\_access\_tier](#input\_storage\_account\_access\_tier) | The Storage Account Access Tier | `string` | `"Hot"` | no |
| <a name="input_storage_account_allowed_public_ips"></a> [storage\_account\_allowed\_public\_ips](#input\_storage\_account\_allowed\_public\_ips) | Allowed Map of Public IP Addresses to this Storage Account | `list(string)` | `[]` | no |
| <a name="input_storage_account_blob_retention_days"></a> [storage\_account\_blob\_retention\_days](#input\_storage\_account\_blob\_retention\_days) | The number of days to retain blob backups on the Storage Account.  Set to 0 to disable Blob Retention | `number` | `30` | no |
| <a name="input_storage_account_container_retention_days"></a> [storage\_account\_container\_retention\_days](#input\_storage\_account\_container\_retention\_days) | The number of days to retain container backups on the Storage Account.  Set to 0 to disable Container Retention | `number` | `30` | no |
| <a name="input_storage_account_containers"></a> [storage\_account\_containers](#input\_storage\_account\_containers) | Complex Object of Container Properties to create | <pre>map(object({<br>    container_access = string<br>  }))</pre> | `{}` | no |
| <a name="input_storage_account_is_gen2"></a> [storage\_account\_is\_gen2](#input\_storage\_account\_is\_gen2) | Is Hierarchical Namespace or Gen2 SKU in the Storage Account.  Note this generally not have as deep of backup/soft delete options. | `bool` | `false` | no |
| <a name="input_storage_account_is_versioning_enabled"></a> [storage\_account\_is\_versioning\_enabled](#input\_storage\_account\_is\_versioning\_enabled) | Are blobs versioned in the Storage Account?  Defaults to True | `bool` | `true` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | The object name of the Storage Account V2 Private hosting blobs | `string` | n/a | yes |
| <a name="input_storage_account_network_bypass"></a> [storage\_account\_network\_bypass](#input\_storage\_account\_network\_bypass) | Allowed Values for bypassing the Firewall | `list(string)` | <pre>[<br>  "AzureServices"<br>]</pre> | no |
| <a name="input_storage_account_replication_type"></a> [storage\_account\_replication\_type](#input\_storage\_account\_replication\_type) | The Storage Account Replication Type | `string` | n/a | yes |
| <a name="input_storage_account_resource_group_name"></a> [storage\_account\_resource\_group\_name](#input\_storage\_account\_resource\_group\_name) | The Storage Account Resource Group Name that will host a Storage Account V2 Private hosting blobs | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional default tags to add to the resources being deployed at this layer. Application, Environment and Level are added by default | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
