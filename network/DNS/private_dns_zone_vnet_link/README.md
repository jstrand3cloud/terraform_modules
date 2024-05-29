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
| [azurerm_private_dns_zone_virtual_network_link.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |
| [azurerm_resource_group.dns_zone_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_zone_name"></a> [dns\_zone\_name](#input\_dns\_zone\_name) | The name of the Private DNS Zone being linked | `string` | n/a | yes |
| <a name="input_dns_zone_rg_name"></a> [dns\_zone\_rg\_name](#input\_dns\_zone\_rg\_name) | The name of the Resource Group Containing the DNS Zone being linked | `string` | n/a | yes |
| <a name="input_is_autoregistered"></a> [is\_autoregistered](#input\_is\_autoregistered) | True/False if the DNS Zone should auto-register VM CName entries.  This can be done for only a single VNet per DNS Zone | `bool` | `false` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The name of the VNET being linked | `string` | n/a | yes |
| <a name="input_vnet_rg_name"></a> [vnet\_rg\_name](#input\_vnet\_rg\_name) | The name of the Resource Group Containing the VNET being linked | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_dns_zone_virtual_network_link_name"></a> [private\_dns\_zone\_virtual\_network\_link\_name](#output\_private\_dns\_zone\_virtual\_network\_link\_name) | n/a |
