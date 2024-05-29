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
  default = "afwp"
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

# Overrides
variable "name_override" {
  default = ""
}

# Required
variable "resource_group_name" {
  default = ""
}

# Optional
variable "sku" {
  type    = string
  default = "Standard"
}
variable "intrusion_detection_mode" {
  type    = string
  default = "Off"
}
variable "dns_proxy_enabled" {
  type    = bool
  default = false
}
variable "dns_servers" {
  default = null
}

# Create Firewall Policy
#   Name format (scope: resource group, characters: 1-80 [alphanumeric, _, -]): 
#     "<abbreviation>-<application_name>-<subscription_type>-<environment>-<location>-<instance_number>"
resource "azurerm_firewall_policy" "firewall_policy" {
  # required
  name                  = var.name_override != "" ? var.name_override : "${var.abbreviation}-${var.application_name}-${var.subscription_type}-${var.environment}-${var.location}-${var.instance_number}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  # optional
  sku                   = var.sku

  # optional
  dns {
    # optional
    proxy_enabled         = var.dns_proxy_enabled
    servers               = var.dns_servers
  }

  # optional
  # NOTE: this sets an intrusion_detection block and its mode, only if the 'intrusion_detection' variable is set
  dynamic "intrusion_detection" {
    for_each = var.intrusion_detection_mode != "Off" ? [1] : []
    content {
      mode = var.intrusion_detection_mode
    }
  }
}

# Outputs
output "firewall_policy" {
  value = azurerm_firewall_policy.firewall_policy
}
output "id" {
  value = azurerm_firewall_policy.firewall_policy.id
}