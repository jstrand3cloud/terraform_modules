## Shared Properties ##

variable "location" {
  description = "Region in which to deploy these resources"
  type        = string
  default     = "eastus"
}


variable "tags" {
  type        = map(string)
  description = "Additional default tags to add to the resources being deployed at this layer. Application, Environment and Level are added by default"
  default     = {}
}

## Module Properties ##

variable "recovery_services_vault" {
  type        = string
  description = "The name of the Recovery Services Vault"
}

variable "recovery_services_vault_rg_name" {
  type        = string
  description = "The name of the resource group in which to create the Recovery Services Vault."
}

variable "recovery_services_vault_sku" {
  type        = string
  description = "The name of the SKU for the Recovery Services Vault"

  validation {
    condition     = contains(["Standard", "RS0"], var.recovery_services_vault_sku)
    error_message = "This needs to match a supported Recovery Services Vault SKU, Standard or RS0."
  }
}

# variable "client_abbr_name" {}
/*
variable "rsv_dns_zone_id" {}
variable "rsv_subnet_id" {}
*/