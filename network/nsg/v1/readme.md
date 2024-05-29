<!-- BEGIN_TF_DOCS -->
# nsg Module

This module will create a single NSG, allow it to associate to 1 or more Subnets, and integrate its flow logs into a single Log Analytics Workspace.  This is a MVP (Minimum Viable Product) Module and will be added to as necessary.

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
| [azurerm_network_security_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name of the NSG to be created | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | The name of the resource group that will hold the new NSG | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Region in which to deploy these resources | `string` | `"eastus"` | no |
| <a name="input_security_rules"></a> [security\_rules](#input\_security\_rules) | The initial rules to add into the NSG object | <pre>set(object(<br>    {<br>      access                                     = string<br>      description                                = string<br>      destination_address_prefix                 = string<br>      destination_application_security_group_ids = set(string)<br>      destination_port_range                     = string<br>      direction                                  = string<br>      name                                       = string<br>      priority                                   = number<br>      protocol                                   = string<br>      source_address_prefix                      = string<br>      source_application_security_group_ids      = set(string)<br>      source_port_range                          = string<br>    }<br>  ))</pre> | `null` | no |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | The Subnet id to attach the NSG | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional default tags to add to the resources being deployed at this layer. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nsg"></a> [nsg](#output\_nsg) | n/a |
| <a name="output_nsg_id"></a> [nsg\_id](#output\_nsg\_id) | n/a |
| <a name="output_nsg_name"></a> [nsg\_name](#output\_nsg\_name) | n/a |
<!-- END_TF_DOCS -->