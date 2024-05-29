<!-- BEGIN_TF_DOCS -->
# subnet Module

This module will create a customized number of subnets.  This module is starting at MVP (Minimum Viable Product) and will expand as functionality is required.

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
| [azurerm_subnet.subnets](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_delegation_actions"></a> [delegation\_actions](#input\_delegation\_actions) | List of delegation actions | `list(string)` | n/a | yes |
| <a name="input_delegation_name"></a> [delegation\_name](#input\_delegation\_name) | Name of delegation | `string` | n/a | yes |
| <a name="input_enforce_private_link_endpoint_network_policies"></a> [enforce\_private\_link\_endpoint\_network\_policies](#input\_enforce\_private\_link\_endpoint\_network\_policies) | Bool for if network policies are enforced | `bool` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | The Virtual Network Resource Group Name that should have the subnets created into them | `any` | n/a | yes |
| <a name="input_service_endpoints"></a> [service\_endpoints](#input\_service\_endpoints) | list of service endpoints | `list(string)` | n/a | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Name of subnet | `string` | n/a | yes |
| <a name="input_subnet_range"></a> [subnet\_range](#input\_subnet\_range) | CIDR range of subnet | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Required) Tags to be applied | `map(string)` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The Virtual Network that should have the subnets created into them | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Region in which to deploy these resources | `string` | `"eastus"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnets"></a> [subnets](#output\_subnets) | n/a |
| <a name="output_subnets_id"></a> [subnets\_id](#output\_subnets\_id) | n/a |
<!-- END_TF_DOCS -->