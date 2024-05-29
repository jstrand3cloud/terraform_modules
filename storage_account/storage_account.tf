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


# Service Abbreviation
variable "abbreviation" {
  default = "st"
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
variable "instance_number" {
  default = ""
}

# Name Override
variable "name_override" {
  default = ""
}

# Required
variable "resource_group_name" {
  default = ""
}
# variable "subnet_id" {
#   default = ""
# }

# Optional
variable "account_tier" {
  default = "Standard"
}
variable "account_replication_type" {
  default = "GRS"
}
variable "account_kind" {
  default = "StorageV2"
}
variable "access_tier" {
  default = "Hot"
}
variable "allow_nested_items_to_be_public" {
  default = false
}
variable "infrastructure_encryption_enabled" {
  default = false
}
variable "shared_access_key_enabled" {
  default = true  
}
variable "tags" {}

# Generate Random IDs for use in a unique name
resource "random_id" "storage_account" {
  keepers = {
    group_name = var.resource_group_name
  }
  byte_length = 2 # NOTE: A hex string will be twice as long as the byte_length
}

# Create a Storage Account
#   Name format (scope: global , characters: 3-24 characters [lowercase letters and numbers]): 
#     "<abbreviation><application_name><subscription_type><environment><instance_number><random_hex_4_characters>"
resource "azurerm_storage_account" "storage_account" {
  # required
  name                            = var.name_override != "" ? "${var.name_override}${random_id.storage_account.hex}" : "${var.abbreviation}${var.application_name}${var.subscription_type}${var.environment}${var.instance_number}${random_id.storage_account.hex}"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  # optional
  account_tier                    = var.account_tier
  account_replication_type        = var.account_replication_type
  account_kind                    = var.account_kind
  access_tier                     = var.access_tier
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
  shared_access_key_enabled       = var.shared_access_key_enabled 
    blob_properties {
    delete_retention_policy {
      days = 7
    }
    container_delete_retention_policy {
        days = 7
      }
    }
  #   network_rules {
  #   default_action             = "Allow"
  #   bypass                     = ["AzureServices"]
  #   ip_rules                   = ["74.202.103.18"]
  #   virtual_network_subnet_ids = [var.subnet_id]
  # }
  tags                            = var.tags
}

# Outputs
output "storage_account" {
  value = azurerm_storage_account.storage_account
}
output "name" {
  value = azurerm_storage_account.storage_account.name
}
output "id" {
  value = azurerm_storage_account.storage_account.id
}