# Required Provider
# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       #version = ">= 3.0.2"
#       version = "~> 3.76.0" # For production grade
#     }
#   }
#   required_version = ">= 1.1.0"
# }

# Allowed IP Ranges and Subnet ids
variable "allowed_ip_ranges" {
  default = null
}
variable "allowed_network_subnet_ids" {
  default = []
}

# Service Abbreviations
variable "abbreviation" {
  type    = string
  default = "kv"
}

# Naming Conventions
variable "application_name" {
  default = ""
}
variable "subscription_type" {
  default = ""
}
variable "environment" {
  default = ""
}
variable "location" {
  default = ""
}
# variable "instance_number" {
#   default = ""
# }

# Name Override
variable "name_override" {
  default = ""
}

# Required 
variable "resource_group_name" {
  default = ""
}
variable "sku_name" {
  default = "standard"
}

# Optional
variable "tags" {}
variable "enabled_for_deployment" {
  default = false
}
variable "enabled_for_disk_encryption" {
  default = true
}
variable "enabled_for_template_deployment" {
  default = false
}
variable "enable_rbac_authorization" {
  default = true
}
variable "purge_protection_enabled" {
  default = true
}
variable "soft_delete_retention_days" {
  default = 7
}
variable "public_network_access_enabled" {
  default = true
}

# Get current client configuration from azurerm provider
data "azurerm_client_config" "current" {}

# Generate Random IDs for use in a unique name
resource "random_id" "key_vault" {
  keepers = {
    group_name = var.resource_group_name
  }
  byte_length = 2 # NOTE: A hex string will be twice as long as the byte_length
}

# Create a Key Vault
#   Name format (scope: global, characters: 3-24 [alphanumerics, -]): 
#     "<abbreviation><application_name><subscription_type><environment><instance_number><random_hex_4_characters>"
resource "azurerm_key_vault" "key_vault" {
  # required
  name                            = var.name_override != "" ? "${var.name_override}${random_id.key_vault.hex}" : "${var.abbreviation}${var.application_name}${var.subscription_type}${var.environment}${random_id.key_vault.hex}"
  location                        = var.location
  resource_group_name             = var.resource_group_name
  sku_name                        = var.sku_name
  tenant_id                       = data.azurerm_client_config.current.tenant_id # current tenant_id from azurerm provider
  # optional
  tags                            = var.tags
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enable_rbac_authorization       = var.enable_rbac_authorization
  purge_protection_enabled        = var.purge_protection_enabled
  soft_delete_retention_days      = var.soft_delete_retention_days
  public_network_access_enabled   = var.public_network_access_enabled

  network_acls {
    bypass         = "AzureServices"
    default_action = "Deny"
    ip_rules       = var.allowed_ip_ranges
    virtual_network_subnet_ids = var.allowed_network_subnet_ids
  }

  lifecycle {
    ignore_changes = [tenant_id]
  }
}



# Outputs
output "key_vault" {
  value = azurerm_key_vault.key_vault
}
output "id" {
  value = azurerm_key_vault.key_vault.id
}
output "vault_uri" {
  value = azurerm_key_vault.key_vault.vault_uri
}