<!-- BEGIN_TF_DOCS -->
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
| [azurerm_application_gateway.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_autoscale_configuration"></a> [autoscale\_configuration](#input\_autoscale\_configuration) | Autoscale configuration | <pre>object({<br>        min_capacity = number<br>        max_capacity = number<br>    })</pre> | <pre>{<br>  "max_capacity": 3,<br>  "min_capacity": 0<br>}</pre> | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | A list of availability zones denoting where the Application Gateway needs to be created | `list(number)` | <pre>[<br>  "1",<br>  "2",<br>  "3"<br>]</pre> | no |
| <a name="input_backend_address_pools"></a> [backend\_address\_pools](#input\_backend\_address\_pools) | Backend address pool | `any` | `{}` | no |
| <a name="input_backend_http_settings"></a> [backend\_http\_settings](#input\_backend\_http\_settings) | Backend HTTP settings | `any` | `{}` | no |
| <a name="input_basic_request_routing_rules"></a> [basic\_request\_routing\_rules](#input\_basic\_request\_routing\_rules) | Basic request routing rules | `any` | `{}` | no |
| <a name="input_http_listeners"></a> [http\_listeners](#input\_http\_listeners) | HTTP listeners | `any` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | The location/region where the Application Gateway is created | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the Application Gateway | `string` | n/a | yes |
| <a name="input_private_ip_address"></a> [private\_ip\_address](#input\_private\_ip\_address) | The private IP address of the Application Gateway | `string` | n/a | yes |
| <a name="input_probes"></a> [probes](#input\_probes) | Probes | `any` | `{}` | no |
| <a name="input_public_ip_address_id"></a> [public\_ip\_address\_id](#input\_public\_ip\_address\_id) | The ID of the public IP address | `string` | n/a | yes |
| <a name="input_redirect_configurations"></a> [redirect\_configurations](#input\_redirect\_configurations) | Redirect configurations | `any` | `{}` | no |
| <a name="input_redirect_request_routing_rules"></a> [redirect\_request\_routing\_rules](#input\_redirect\_request\_routing\_rules) | Redirect request routing rules | <pre>map(object({<br>        name = string<br>        http_listener_name = string<br>        redirect_configuration_name = string<br>        priority = number<br>    }))</pre> | `{}` | no |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | The name of the resource group in which the Application Gateway is created | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The name of the SKU | `string` | n/a | yes |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | The tier of the SKU | `string` | n/a | yes |
| <a name="input_ssl_certificates"></a> [ssl\_certificates](#input\_ssl\_certificates) | SSL certificates | `any` | `{}` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the subnet | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags to associate with your network security group. | `map(string)` | n/a | yes |
| <a name="input_trusted_root_certificates"></a> [trusted\_root\_certificates](#input\_trusted\_root\_certificates) | Trusted root certificates | `any` | `{}` | no |
| <a name="input_user_assigned_identity_id"></a> [user\_assigned\_identity\_id](#input\_user\_assigned\_identity\_id) | The ID of the user assigned identity | `string` | n/a | yes |
| <a name="input_waf_configuration"></a> [waf\_configuration](#input\_waf\_configuration) | WAF configuration | <pre>object({<br>        enabled = bool<br>        firewall_mode = string<br>        rule_set_type = string<br>        rule_set_version = string<br>    })</pre> | <pre>{<br>  "enabled": true,<br>  "firewall_mode": "Detection",<br>  "rule_set_type": "OWASP",<br>  "rule_set_version": "3.2"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END_TF_DOCS -->