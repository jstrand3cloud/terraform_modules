<!-- BEGIN_TF_DOCS -->
# Route table Module

This module will create a route table with desired routes.

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
| [azurerm_route.nva](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |
| [azurerm_route.vnet-local](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |
| [azurerm_route_table.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |
| [azurerm_subnet_route_table_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disable_bgp_route_propagation"></a> [disable\_bgp\_route\_propagation](#input\_disable\_bgp\_route\_propagation) | Should this route table not send routes learned via Network Gateway/BGP? | `bool` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Resource Name | `string` | n/a | yes |
| <a name="input_nva_routes"></a> [nva\_routes](#input\_nva\_routes) | Object that contains the routes desired to go through an NVA | <pre>list(object({<br>    name           = string<br>    address_prefix = string<br>    next_hop_ip    = string<br>  }))</pre> | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource group | `string` | n/a | yes |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | Subnet ID to attach route table | `string` | n/a | yes |
| <a name="input_vnetlocal_routes"></a> [vnetlocal\_routes](#input\_vnetlocal\_routes) | Object that contains the routes desired to leverage default azure routing | <pre>list(object({<br>    name           = string<br>    address_prefix = string<br>  }))</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Region in which to deploy these resources | `string` | `"eastus"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | These are the Azure Tags that will be associated to resources that support them. | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->