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
  default = "vnet"
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
variable "resource_group_name" {
  default = ""
}
variable "address_space" {
  default = null
}

# Optional
variable "dns_servers" {
  default = null
}
variable "bgp_community" {
  default = null
}
variable "edge_zone" {
  default = null
}
variable "flow_timeout_in_minutes" {
  default = null
}
variable "tags" {}

# Create a Virtual Network (VNET)
#   Name format (scope: resource group, characters: 2-64 [alphanumerics, _, ., -]): 
#     "<abbreviation>-<application_name>-<subscription_type>-<environment>-<location>-<instance_number>"
resource "azurerm_virtual_network" "virtual_network" {
  # required
  name                    = var.name_override != "" ? var.name_override : "${var.abbreviation}-${var.application_name}-${var.subscription_type}-${var.environment}-${var.location}" #-${var.instance_number}"
  resource_group_name     = var.resource_group_name
  location                = var.location
  address_space           = var.address_space
  # optional
  dns_servers             = var.dns_servers
  bgp_community           = var.bgp_community
  edge_zone               = var.edge_zone
  flow_timeout_in_minutes = var.flow_timeout_in_minutes
  tags                    = var.tags
}

# Outputs
output "virtual_network" {
  value = azurerm_virtual_network.virtual_network
}
output "id" {
  value = azurerm_virtual_network.virtual_network.id
}
output "name" {
  value = azurerm_virtual_network.virtual_network.name
}