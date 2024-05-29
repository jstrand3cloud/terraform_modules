## Shared Properties ##

variable "location" {
  description = "The Azure Region in which to the newly created Recovery Services Vault"
  type        = string
  nullable    = false
}

variable "tags" {
  type        = map(string)
  description = "Azure Tags that should be added to the newly created Recovery Services Vault"
  default     = {}
  nullable    = false
}

## Module Properties ##

variable "recovery_services_vault_name" {
  description = "The display name of the Recovery Services Vault to be created"
  type        = string
  nullable    = false
}

variable "rsv_resource_group_name" {
  description = "The name of the resource group of the Recovery Services Vault to be created"
  type        = string
  nullable    = false
}

variable "vault_sku" {
  description = "The Recovery Services Vault SKU of the Recovery Services Vault to be created"
  type        = string
  default     = "Standard"
  nullable    = false
}

variable "storage_mode_type" {
  description = "The storage type of the Recovery Services Vault to be created"
  type        = string
}

variable "rsv_public_network_access_enabled" {
  description = "A boolean flag to determine if the Recovery Services Vault should be publicly accessible"
  type        = bool
  default     = true
  nullable    = false
}


