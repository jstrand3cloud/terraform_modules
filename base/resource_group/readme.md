<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.25.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>3.25.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_mapping"></a> [app\_mapping](#input\_app\_mapping) | Application Mapping: Full \| 3 to 4-CHAR | `map(string)` | <pre>{<br>  "Active Directory Resources": "ADS",<br>  "Azure Migrate": "MIG",<br>  "Azure Monitor": "AZM",<br>  "Azure Site Recovery": "ASR",<br>  "Management Resources": "MGT",<br>  "Network Resources": "NET",<br>  "Network Testing Resources": "NTEST",<br>  "Shared Services": "SS"<br>}</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | Azure Region to create the resource in | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name for this Resource Group | `string` | n/a | yes |
| <a name="input_region_mapping"></a> [region\_mapping](#input\_region\_mapping) | Region Mapping: Full \| 4-CHAR | `map(string)` | <pre>{<br>  "australiaeast": "AUEA",<br>  "australiasoutheast": "AUSW",<br>  "brazilsouth": "BRSO",<br>  "canadaceast": "CAEA",<br>  "canadacentral": "CACE",<br>  "centralindia": "INCE",<br>  "centralus": "USCE",<br>  "eastasia": "ASEE",<br>  "eastus": "USEA",<br>  "eastus2": "USE2",<br>  "germanywestcentral": "GMWC",<br>  "japaneast": "JAEA",<br>  "japanwest": "JAWE",<br>  "koreacentral": "KOCE",<br>  "koreasouth": "KOSO",<br>  "northcentralus": "USNC",<br>  "northeurope": "EUNO",<br>  "southcentralus": "USSC",<br>  "southeastasia": "ASEA",<br>  "southindia": "INSO",<br>  "uksouth": "UKSO",<br>  "ukwest": "UKWE",<br>  "westcentralus": "USWC",<br>  "westeurope": "EUWE",<br>  "westindia": "INWE",<br>  "westus": "USWE",<br>  "westus2": "USW2"<br>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional default tags to add to the resources being deployed at this layer. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource ID of created resource group |
| <a name="output_name"></a> [name](#output\_name) | Resource name of created resource group |
<!-- END_TF_DOCS -->