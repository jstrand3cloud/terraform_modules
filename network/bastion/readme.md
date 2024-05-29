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
| [azurerm_bastion_host.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host) | resource |
| [azurerm_public_ip.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | Defines the allocation method for this IP address. Possible values are Static or Dynamic. | `string` | `"Static"` | no |
| <a name="input_bastion_name"></a> [bastion\_name](#input\_bastion\_name) | Specifies the name of the Bastion Host. Changing this forces a new resource to be created | `string` | n/a | yes |
| <a name="input_bastion_sku"></a> [bastion\_sku](#input\_bastion\_sku) | The SKU of the Bastion Host. Accepted values are Basic and Standard | `string` | `"Basic"` | no |
| <a name="input_bastion_subnet"></a> [bastion\_subnet](#input\_bastion\_subnet) | Reference to a subnet in which this Bastion Host has been created. | `string` | n/a | yes |
| <a name="input_copy_paste_enabled"></a> [copy\_paste\_enabled](#input\_copy\_paste\_enabled) | Is Copy/Paste feature enabled for the Bastion Host. | `string` | `"true"` | no |
| <a name="input_file_copy_enabled"></a> [file\_copy\_enabled](#input\_file\_copy\_enabled) | Is File Copy feature enabled for the Bastion Host. | `string` | `"false"` | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_pip_sku"></a> [pip\_sku](#input\_pip\_sku) | The SKU of the Public IP. Accepted values are Basic and Standard. | `string` | `"Standard"` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | The name of the resource group in which to create the Bastion Host. Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

No outputs.
