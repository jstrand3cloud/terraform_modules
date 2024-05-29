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
  default = "rg"
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

# Overrides
variable "name_override" {
  default = ""
}

# Optional
variable "tags" {}
variable "instance_number" {
  default = ""
}

# Create a Resource Group
#   Name format (scope: subscription, characters: 1-90 [alphanumeric, _, ., -, ()]): 
#     "<abbreviation>-<application_name>-<subscription_type>-<environment>-<location>-<instance_number>"
resource "azurerm_resource_group" "resource_group" {
  # required
  #name     = var.name_override != "" ? var.name_override : "${var.abbreviation}-${var.application_name}-${var.subscription_type}-${var.environment}-${var.location}" #-${var.instance_number}"
 name = var.name_override != "" ? var.name_override : (
    var.instance_number != "" ? 
    "${var.abbreviation}-${var.application_name}-${var.subscription_type}-${var.environment}-${var.location}-${var.instance_number}" :
    "${var.abbreviation}-${var.application_name}-${var.subscription_type}-${var.environment}-${var.location}"
  )
  location = var.location
  # optional
  tags     = var.tags
}

# Outputs
output "resource_group" {
  value = azurerm_resource_group.resource_group
}
output "id" {
  value = azurerm_resource_group.resource_group.id
}
output "name" {
  value = azurerm_resource_group.resource_group.name
}
output "location" {
  value = azurerm_resource_group.resource_group.location
}