# terraform {
#  required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       #version = ">= 3.0.2"
#       version = "~> 3.76.0" # For production grade
#     }
#   }
#   required_version = ">= 1.1.0"
# }


# Service Abbreviations
variable "abbreviation" {
  default = "nsg"
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

# Overrides
variable "name_override" {
  default = ""
}

# Required
variable "resource_group_name" {}

# Optional
variable "tags" {}

# Create a Network Security Group
#   Name format (scope: resource group, characters: 1-80 [alphanumeric, _, ., -]):
#     "<abbreviation>-<application_name>-<subscription_type>-<environment>-<location>-<instance_number>-<random_hex_4_bytes>"
resource "azurerm_network_security_group" "network_security_group" {
  # required
  name                = var.name_override != "" ? var.name_override : "${var.abbreviation}-${var.application_name}-${var.subscription_type}-${var.environment}-${var.location}"#-${var.instance_number}
  location            = var.location
  resource_group_name = var.resource_group_name
  # optional
  tags                = var.tags
}

# Outputs
output "network_security_group" {
  value = azurerm_network_security_group.network_security_group
}
output "id" {
  value = azurerm_network_security_group.network_security_group.id
}
output "name" {
  value = azurerm_network_security_group.network_security_group.name
}
# output "resource_group_name" {
#   value = azurerm_network_security_group.network_security_group.resource_group_name
# }