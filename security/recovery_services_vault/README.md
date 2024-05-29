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
| [azurerm_recovery_services_vault.vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/recovery_services_vault) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_Recovery_services_vault"></a> [Recovery\_services\_vault](#input\_Recovery\_services\_vault) | The name of the Recovery Services Vault | `string` | n/a | yes |
| <a name="input_Recovery_services_vault_rg_name"></a> [Recovery\_services\_vault\_rg\_name](#input\_Recovery\_services\_vault\_rg\_name) | The name of the resource group in which to create the Recovery Services Vault. | `string` | n/a | yes |
| <a name="input_Recovery_services_vault_sku"></a> [Recovery\_services\_vault\_sku](#input\_Recovery\_services\_vault\_sku) | The name of the SKU for the Recovery Services Vault | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Region in which to deploy these resources | `string` | `"eastus"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional default tags to add to the resources being deployed at this layer. Application, Environment and Level are added by default | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rsv_name"></a> [rsv\_name](#output\_rsv\_name) | n/a |
