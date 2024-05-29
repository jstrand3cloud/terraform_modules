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
| [azurerm_private_dns_a_record.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_a_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_record_ip_address"></a> [a\_record\_ip\_address](#input\_a\_record\_ip\_address) | The list of IP addresses to associate to the A Record.  We will generally only associate a single IP address to an A Record | `list(string)` | n/a | yes |
| <a name="input_a_record_name"></a> [a\_record\_name](#input\_a\_record\_name) | This is the name of the Private DNS Zone A Record | `string` | n/a | yes |
| <a name="input_a_record_ttl"></a> [a\_record\_ttl](#input\_a\_record\_ttl) | The Time To Live (TTL) of the A Record, in seconds | `number` | `300` | no |
| <a name="input_dns_zone_name"></a> [dns\_zone\_name](#input\_dns\_zone\_name) | This is the name of the Private DNS Zone that will contain the A Record | `string` | n/a | yes |
| <a name="input_dns_zone_rg_name"></a> [dns\_zone\_rg\_name](#input\_dns\_zone\_rg\_name) | The name of the resource group to use for the Private DNS Zone that will contain the A Record | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional default tags to add to the resources being deployed at this layer. Application, Environment and Level are added by default | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_a_record_fqdn"></a> [dns\_a\_record\_fqdn](#output\_dns\_a\_record\_fqdn) | n/a |
| <a name="output_dns_a_record_ip_addresses"></a> [dns\_a\_record\_ip\_addresses](#output\_dns\_a\_record\_ip\_addresses) | n/a |
