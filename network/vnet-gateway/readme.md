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
| [azurerm_public_ip.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_virtual_network_gateway.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_active_active"></a> [active\_active](#input\_active\_active) | If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance SKU. | `bool` | `false` | no |
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | This can be set to Static or Dynamic | `string` | `"Dynamic"` | no |
| <a name="input_enable_bgp"></a> [enable\_bgp](#input\_enable\_bgp) | If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway | `bool` | `false` | no |
| <a name="input_gateway_subnet_id"></a> [gateway\_subnet\_id](#input\_gateway\_subnet\_id) | n/a | `string` | n/a | yes |
| <a name="input_ip_configuration_private_ip_allocation"></a> [ip\_configuration\_private\_ip\_allocation](#input\_ip\_configuration\_private\_ip\_allocation) | Defines how the private IP address of the gateways virtual interface is assigned. Valid options are Static or Dynamic. | `string` | `"Dynamic"` | no |
| <a name="input_location"></a> [location](#input\_location) | The location/region where the Virtual Network Gateway is located. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | The name of the resource group in which to create the Virtual Network Gateway. Changing this forces a new resource to be created | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | Configuration of the size and capacity of the virtual network gateway. Valid options are Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4,VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ,VpnGw4AZ and VpnGw5AZ and depend on the type, vpn\_type and generation arguments. A PolicyBased gateway only supports the Basic SKU. Further, the UltraPerformance SKU is only supported by an ExpressRoute gateway | `string` | `"basic"` | no |
| <a name="input_type"></a> [type](#input\_type) | The type of the Virtual Network Gateway. Valid options are Vpn or ExpressRoute. Changing the type forces a new resource to be created | `string` | `"Vpn"` | no |
| <a name="input_vnet_gateway_name"></a> [vnet\_gateway\_name](#input\_vnet\_gateway\_name) | The name of the Virtual Network Gateway. Changing this forces a new resource to be created | `string` | n/a | yes |
| <a name="input_vpn_client_configuration_address_space"></a> [vpn\_client\_configuration\_address\_space](#input\_vpn\_client\_configuration\_address\_space) | The address space out of which IP addresses for vpn clients will be taken. You can provide more than one address space, e.g. in CIDR notation | `string` | `""` | no |
| <a name="input_vpn_type"></a> [vpn\_type](#input\_vpn\_type) | The routing type of the Virtual Network Gateway. Valid options are RouteBased or PolicyBased. | `string` | `"PolicyBased"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | n/a |
