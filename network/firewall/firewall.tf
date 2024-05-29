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


# Service Abbreviations
variable "abbreviation" {
  type    = string
  default = "afw"
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
  default = null
}

# Requirements
variable "resource_group_name" {
  default = ""
}
variable "sku_name" {
  default = "AZFW_Hub"
}
variable "sku_tier" {
  default = "Premium"
}

# Optional
variable "threat_intel_mode" {
  default = "Alert"
}
variable "zones" {
  default = []
}
variable "firewall_policy_id" {}
variable "azurerm_virtual_hub.vwhub.id" {}
variable "tags" {}
variable "ip_configuration_name" {
  default = "AzFConfig"
}
variable "ip_configuration_public_ip_address_id" {}
variable "ip_configuration_subnet_id" {}

# Create a Firewall
#   Name format (scope Resource Group, max 80 characters [alphanumeric, _, ., -]):
#     "<application_name>-<subscription_type>-<environment>-<location>-<instance_number>"

# NOTE: "The Subnet used for the Firewall must have the name AzureFirewallSubnet and the subnet mask must be at least a /26."
#   - source: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall
resource "azurerm_firewall" "firewall" {
  # required
  name                    = var.name_override != null ? var.name_override : "${var.abbreviation}-${var.application_name}-${var.subscription_type}-${var.environment}-${var.location}"#-${var.instance_number}"
  location                = var.location
  resource_group_name     = var.resource_group_name
  sku_name                = var.sku_name
  sku_tier                = var.sku_tier
  # optional    
  threat_intel_mode       = var.threat_intel_mode
  zones                   = var.zones
  firewall_policy_id      = var.firewall_policy_id
  virtual_hub {
    virtual_hub_id = azurerm_virtual_hub.vwhub.id
    public_ip_count = 1
  }
  tags                    = var.tags
  # optional
  ip_configuration {
    # required
    name                  = var.ip_configuration_name
    public_ip_address_id  = var.ip_configuration_public_ip_address_id
    # optional
    subnet_id             = var.ip_configuration_subnet_id
  }
}

# Outputs
output "firewall" {
  value = azurerm_firewall.firewall
}
output "id" {
  value = azurerm_firewall.firewall.id
}
output "ip_configuration" {
  value = azurerm_firewall.firewall.ip_configuration
}
output "virtual_hub" {
  value = azurerm_firewall.firewall.virtual_hub
}
output "private_ip_address" {
  value = azurerm_firewall.firewall.ip_configuration[0].private_ip_address
}