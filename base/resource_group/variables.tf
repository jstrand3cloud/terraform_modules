variable "tags" {
  type        = map(string)
  description = "Additional default tags to add to the resources being deployed at this layer."
  default     = {}
}

variable "name" {
  description = "Name for this Resource Group"
  type        = string
}

variable "location" {
  description = "Azure Region to create the resource in"
  type        = string
}

variable "region_mapping" {
  type        = map(string)
  description = "Region Mapping: Full | 4-CHAR"
  default = {
    eastus             = "USEA"
    eastus2            = "USE2"
    centralus          = "USCE"
    northcentralus     = "USNC"
    southcentralus     = "USSC"
    westcentralus      = "USWC"
    westus2            = "USW2"
    westus             = "USWE"
    canadaceast        = "CAEA"
    canadacentral      = "CACE"
    brazilsouth        = "BRSO"
    northeurope        = "EUNO"
    westeurope         = "EUWE"
    germanywestcentral = "GMWC"
    uksouth            = "UKSO"
    ukwest             = "UKWE"
    japaneast          = "JAEA"
    japanwest          = "JAWE"
    eastasia           = "ASEE"
    southeastasia      = "ASEA"
    australiaeast      = "AUEA"
    australiasoutheast = "AUSW"
    koreacentral       = "KOCE"
    koreasouth         = "KOSO"
    centralindia       = "INCE"
    southindia         = "INSO"
    westindia          = "INWE"
  }
}

variable "app_mapping" {
  type        = map(string)
  description = "Application Mapping: Full | 3 to 4-CHAR"
  default = {
    "Azure Migrate"              = "MIG"
    "Network Resources"          = "NET"
    "Network Testing Resources"  = "NTEST"
    "Azure Monitor"              = "AZM"
    "Management Resources"       = "MGT"
    "Active Directory Resources" = "ADS"
    "Azure Site Recovery"        = "ASR"
    "Shared Services"            = "SS"
  }
}