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
  default = "bas"
}
variable "ip_configuration_abbreviation" {
  type    = string
  default = "ipconf-bas"
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
variable "ip_configuration_name_override" {
  default = null
}

# Required
variable "resource_group_name" {
  type        = string
  description = "(Required) Resource Group Name"
}
variable "ip_configuration_subnet_id" {
  # NOTE: The Subnet used for the Bastion Host must have the name 'AzureBastionSubnet' and 
  #   the subnet mask must be at least a '/26'.
  type        = string
  description = "(Required) Subnet ID for Bastion Host"
}
variable "ip_configuration_public_ip_address_id" {
  type        = string
  description = "(Required) Public IP Address ID to associate with Bastion Host"
}

# Optional
variable "sku" {
  type        = string
  description = "(Optional) The SKU for the Bastion Host (default: Basic, accepted: Basic, Standard)"
  default     = "Basic"
}
variable "copy_paste_enabled" {
  type        = bool
  description = "(Optional) Copy/Paste feature enabled for the Bastion Host (default: true)"
  default     = true
}
variable "file_copy_enabled" { # NOTE: requires 'sku' to be 'Standard'
  type        = bool
  description = "(Optional) Is File Copy feature enabled for the Bastion Host (default: false)"
  default     = false
}
variable "ip_connect_enabled" {
  type        = bool
  description = "(Optional) Is IP Connect feature enabled for the Bastion Host (default: false)"
  default     = false
}
variable "tags" {}

# Create a Bastion Host
#   Name format (scope: Resource Group, characters: 1-80 characters [alphanumeric, _, ., -]):
#     "<abbreviation>-<application_name>-<subscription_type>-<environment>-<location>-<instance_number>"
resource "azurerm_bastion_host" "bastion_host" {
  # required
  name                    = var.name_override != null ? var.name_override : "${var.abbreviation}-${var.application_name}-${var.subscription_type}-${var.environment}-${var.location}"#-${var.instance_number}
  resource_group_name     = var.resource_group_name
  location                = var.location
  # optional
  sku                     = var.sku
  tags                    = var.tags
  # required
  ip_configuration {
    # required
    name                 = var.ip_configuration_name_override != null ? var.ip_configuration_name_override : "${var.ip_configuration_abbreviation}-${var.application_name}-${var.subscription_type}-${var.environment}-${var.location}"#-${var.instance_number}
    subnet_id            = var.ip_configuration_subnet_id
    public_ip_address_id = var.ip_configuration_public_ip_address_id
  }
}

# Outputs
output "bastion_host" {
  value = azurerm_bastion_host.bastion_host
}
output "id" {
  value = azurerm_bastion_host.bastion_host.id
}
output "dns_name" {
  value = azurerm_bastion_host.bastion_host.dns_name
}