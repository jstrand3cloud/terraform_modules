## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.breakglassadmin](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.myprivateSshKey](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.mypublicSshKey](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_linux_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_security_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [tls_private_key.key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_avset_name"></a> [avset\_name](#input\_avset\_name) | Availability set name for naming module | `string` | n/a | yes |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | n/a | `any` | n/a | yes |
| <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name) | Name of the shared VM SSH keyvault created with the hub/shared resources | `string` | n/a | yes |
| <a name="input_license_type"></a> [license\_type](#input\_license\_type) | Possible values RHEL\_BYOS / SLES\_BYOS | `string` | `null` | no |
| <a name="input_local_admin_username"></a> [local\_admin\_username](#input\_local\_admin\_username) | **OPTIONAL**: Name of the local admin account | `string` | `"azureadmin"` | no |
| <a name="input_location"></a> [location](#input\_location) | Region in which to deploy these resources | `string` | n/a | yes |
| <a name="input_naming_standards"></a> [naming\_standards](#input\_naming\_standards) | Configuration for the naming of all resources created by the code base. This configuration is passed up to each layer that follows. It can be overridden at each layer. Names are created via the 3Cloud Naminer Standards module | <pre>object({<br>    tenant                = string #(Optional) Name of the tenant being deployed to. Optional parameter used when clients have multiple tenants and wish it to be part of the naming standard<br>    format_string         = string #(Reauired) The order of the naming values. This allows the configurator to change the naming standard to match the customers needs. By default the order is (environment, location, application, name, resource_type)<br>    format_string_storage = string #(Required) The order for resources with shorter name requirements. Any of the naming values can be used. The naming standard will trim the string to fit example "environment, location, name"<br>    separator             = string #(Required) The character to place between naming values it may be a null string"-"<br>    application           = string #(Required) The name of the application being deployed default for this level is "launchpad"<br>    application_short     = string #(Required) A short version of the application name being deployed default for this level is "lpad"<br>    environment           = string #(Required) The name of the environment being deployed default for this level is "shared"<br>    environment_short     = string #(Required) A short version of the application name being deployed default for this level is "shrd"<br>  })</pre> | <pre>{<br>  "application": "launchpad",<br>  "application_short": "lpad",<br>  "environment": "shared",<br>  "environment_short": "shrd",<br>  "format_string": "environment, location, application, name, resource_type",<br>  "format_string_storage": "environment, location, name",<br>  "separator": "-",<br>  "tenant": ""<br>}</pre> | no |
| <a name="input_nic_name"></a> [nic\_name](#input\_nic\_name) | nic name for naming module | `string` | n/a | yes |
| <a name="input_osdiskcaching"></a> [osdiskcaching](#input\_osdiskcaching) | n/a | `string` | `"ReadWrite"` | no |
| <a name="input_passwordLength"></a> [passwordLength](#input\_passwordLength) | Lenght of the password to be auto created | `number` | `12` | no |
| <a name="input_platform_fault_domain_count"></a> [platform\_fault\_domain\_count](#input\_platform\_fault\_domain\_count) | Number of Fault domains that these VMs will be deployed to | `number` | `3` | no |
| <a name="input_platform_update_domain_count"></a> [platform\_update\_domain\_count](#input\_platform\_update\_domain\_count) | Number of Update domains that these VMs will be deployed to | `number` | `2` | no |
| <a name="input_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#input\_private\_ip\_address\_allocation) | n/a | `any` | n/a | yes |
| <a name="input_recovery_backup_policy_id"></a> [recovery\_backup\_policy\_id](#input\_recovery\_backup\_policy\_id) | Id of backup policy to be applied to the Linux VM | `string` | n/a | yes |
| <a name="input_recovery_services_vault_name"></a> [recovery\_services\_vault\_name](#input\_recovery\_services\_vault\_name) | Recovery service vault name | `string` | n/a | yes |
| <a name="input_recovery_services_vault_rg"></a> [recovery\_services\_vault\_rg](#input\_recovery\_services\_vault\_rg) | Recovery service vault resource group name | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | n/a | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the Resource Group in which to deploy these resources | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | ID of the Subnet to which the machine will connect to. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional default tags to add to the resources being deployed at this layer. | `map(string)` | `null` | no |
| <a name="input_ultra_ssd_enabled"></a> [ultra\_ssd\_enabled](#input\_ultra\_ssd\_enabled) | Should the capacity to enable Data Disks of the UltraSSD\_LRS storage account type be supported on this Virtual Machine | `string` | `"false"` | no |
| <a name="input_vm_image_id"></a> [vm\_image\_id](#input\_vm\_image\_id) | **OPTIONAL**: ID of the custom image to use | `string` | `null` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Name of the virtual machine to create | `string` | n/a | yes |
| <a name="input_vm_offer"></a> [vm\_offer](#input\_vm\_offer) | Offer of the image | `string` | `"UbuntuServer"` | no |
| <a name="input_vm_osdisk_size"></a> [vm\_osdisk\_size](#input\_vm\_osdisk\_size) | n/a | `number` | `128` | no |
| <a name="input_vm_osdisktype"></a> [vm\_osdisktype](#input\_vm\_osdisktype) | Type of OS disk | `string` | `"Standard_LRS"` | no |
| <a name="input_vm_publisher"></a> [vm\_publisher](#input\_vm\_publisher) | Publisher of the image | `string` | `"Canonical"` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | **OPTIONAL**: Size of the vm to deploy | `string` | `"Standard_F2s"` | no |
| <a name="input_vm_sku"></a> [vm\_sku](#input\_vm\_sku) | Sku for the image. | `string` | `"20.04-LTS"` | no |
| <a name="input_vm_timezone"></a> [vm\_timezone](#input\_vm\_timezone) | The Timezone of the session hosts | `string` | `"Eastern Standard Time"` | no |
| <a name="input_vm_version"></a> [vm\_version](#input\_vm\_version) | Verison of the image | `string` | `"latest"` | no |

## Outputs

No outputs.
