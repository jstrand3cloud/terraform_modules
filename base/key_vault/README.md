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
| [azurerm_key_vault.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_access_policy.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_contact"></a> [contact](#input\_contact) | Optional contact block to set contact info for certificate creation.  Must be created after access policy exists (Add this property in after initial run-through) | <pre>set(object(<br>    {<br>      email = string<br>      name  = string<br>      phone = string<br>    }<br>  ))</pre> | `[]` | no |
| <a name="input_enable_rbac_authorization"></a> [enable\_rbac\_authorization](#input\_enable\_rbac\_authorization) | Determine whether authorization using RBAC can be used for the keyvault | `bool` | `false` | no |
| <a name="input_enabled_for_deployment"></a> [enabled\_for\_deployment](#input\_enabled\_for\_deployment) | Determine whether Virtual Machines can access certificates stored within the keyvault | `bool` | `false` | no |
| <a name="input_enabled_for_disk_encryption"></a> [enabled\_for\_disk\_encryption](#input\_enabled\_for\_disk\_encryption) | Determine whether the keyvault can be used to retrieve secrets to unwrap keys for disk encryption | `bool` | `false` | no |
| <a name="input_enabled_for_template_deployment"></a> [enabled\_for\_template\_deployment](#input\_enabled\_for\_template\_deployment) | Determine whether Azure Resource Manager can access secrets stored within the keyvault | `bool` | `false` | no |
| <a name="input_key_vault_default_access_policy"></a> [key\_vault\_default\_access\_policy](#input\_key\_vault\_default\_access\_policy) | n/a | `any` | n/a | yes |
| <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name) | This is the object name of the keyvault | `string` | n/a | yes |
| <a name="input_key_vault_network_acls"></a> [key\_vault\_network\_acls](#input\_key\_vault\_network\_acls) | The network restriction rules for the keyvault | <pre>set(object(<br>    {<br>      bypass                             = string<br>      default_action                     = string<br>      allowed_ip_rules                   = set(string)<br>      allowed_virtual_network_subnet_ids = set(string)<br>    }<br>  ))</pre> | `[]` | no |
| <a name="input_key_vault_resource_group_name"></a> [key\_vault\_resource\_group\_name](#input\_key\_vault\_resource\_group\_name) | The name of the resource group to use for the keyvault | `string` | n/a | yes |
| <a name="input_key_vault_sku_name"></a> [key\_vault\_sku\_name](#input\_key\_vault\_sku\_name) | (required) | `string` | `"standard"` | no |
| <a name="input_location"></a> [location](#input\_location) | Region in which to deploy these resources | `string` | `"eastus"` | no |
| <a name="input_naming_standards"></a> [naming\_standards](#input\_naming\_standards) | Configuration for the naming of all resources created by the code base. This configuration is passed up to each layer that follows. It can be overridden at each layer. Names are created via the 3Cloud Naminer Standards module | <pre>object({<br>    tenant                = string #(Optional) Name of the tenant being deployed to. Optional parameter used when clients have multiple tenants and wish it to be part of the naming standard<br>    format_string         = string #(Reauired) The order of the naming values. This allows the configurator to change the naming standard to match the customers needs. By default the order is (environment, location, application, name, resource_type)<br>    format_string_storage = string #(Required) The order for resources with shorter name requirements. Any of the naming values can be used. The naming standard will trim the string to fit example "environment, location, name"<br>    separator             = string #(Required) The character to place between naming values it may be a null string"-"<br>    application           = string #(Required) The name of the application being deployed default for this level is "launchpad"<br>    application_short     = string #(Required) A short version of the application name being deployed default for this level is "lpad"<br>    environment           = string #(Required) The name of the environment being deployed default for this level is "shared"<br>    environment_short     = string #(Required) A short version of the application name being deployed default for this level is "shrd"<br>  })</pre> | <pre>{<br>  "application": "launchpad",<br>  "application_short": "lpad",<br>  "environment": "shared",<br>  "environment_short": "shrd",<br>  "format_string": "environment, location, application, name, resource_type",<br>  "format_string_storage": "environment, location, name",<br>  "separator": "-",<br>  "tenant": ""<br>}</pre> | no |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled) | Indicate whether a keyvault/secrets can be purged once they were deleted | `bool` | `false` | no |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days) | The number of days to retain this keyvault/secrets if they were deleted | `number` | `90` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional default tags to add to the resources being deployed at this layer. Application, Environment and Level are added by default | `map(string)` | `{}` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_access_policy"></a> [default\_access\_policy](#output\_default\_access\_policy) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_key_vault_name"></a> [key\_vault\_name](#output\_key\_vault\_name) | n/a |
| <a name="output_vault_uri"></a> [vault\_uri](#output\_vault\_uri) | n/a |
