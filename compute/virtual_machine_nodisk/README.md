## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.randpass](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.vm-username](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_network_interface.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_interface_security_group_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_security_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_windows_virtual_machine.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine) | resource |
| [random_string.local_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_adminUser"></a> [adminUser](#input\_adminUser) | Admin username | `string` | `"azvalmontadmin"` | no |
| <a name="input_cache"></a> [cache](#input\_cache) | The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite. | `string` | n/a | yes |
| <a name="input_caching"></a> [caching](#input\_caching) | n/a | `string` | `"None"` | no |
| <a name="input_create_option"></a> [create\_option](#input\_create\_option) | n/a | `string` | `"Empty"` | no |
| <a name="input_disk_size_gb"></a> [disk\_size\_gb](#input\_disk\_size\_gb) | n/a | `number` | `100` | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | Keyvault location to store randomized passwords | `string` | n/a | yes |
| <a name="input_license_type"></a> [license\_type](#input\_license\_type) | n/a | `string` | `"Windows_Server"` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure location where the Windows Virtual Machine should exist | `string` | n/a | yes |
| <a name="input_min_special"></a> [min\_special](#input\_min\_special) | Number of special characters required. | `number` | `1` | no |
| <a name="input_offer"></a> [offer](#input\_offer) | Specifies the offer of the image used to create the virtual machines. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_override_special"></a> [override\_special](#input\_override\_special) | Special characters to use for randomized password | `string` | `"*!@#?"` | no |
| <a name="input_passwordLength"></a> [passwordLength](#input\_passwordLength) | Required password length to meet security minimum | `number` | `12` | no |
| <a name="input_passwordLower"></a> [passwordLower](#input\_passwordLower) | Are lower characters required? | `bool` | `true` | no |
| <a name="input_passwordNumber"></a> [passwordNumber](#input\_passwordNumber) | Are numbers required in the password? | `bool` | `true` | no |
| <a name="input_passwordSpecial"></a> [passwordSpecial](#input\_passwordSpecial) | Are special characters required in the password? | `bool` | `true` | no |
| <a name="input_passwordUpper"></a> [passwordUpper](#input\_passwordUpper) | Are Upper characters required? | `bool` | `true` | no |
| <a name="input_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#input\_private\_ip\_address\_allocation) | The allocation method used for the Private IP Address. Possible values are Dynamic and Static. | `string` | n/a | yes |
| <a name="input_publisher"></a> [publisher](#input\_publisher) | Specifies the Publisher of the Marketplace Image this Virtual Machine should be created from. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | The name of the Resource Group in which the Windows Virtual Machine should be exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | Specifies the SKU of the image used to create the virtual machines. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_storage_account_type"></a> [storage\_account\_type](#input\_storage\_account\_type) | The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard\_LRS, StandardSSD\_LRS, Premium\_LRS, StandardSSD\_ZRS and Premium\_ZRS. Changing this forces a new resource to be created. | `string` | `"Standard_SSD"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `any` | n/a | yes |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | The name of the Windows Virtual Machine. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | The SKU which should be used for this Virtual Machine, such as Standard\_F2. | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | Specifies the Availability Zone in which this Windows Virtual Machine should be located | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource ID of created managed disk |
