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
  default = "log"
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

# Optional
variable "sku" {
  default = "PerGB2018"
}
variable "retention_in_days" {
  default = "365"
}
variable "tags" {}

# Locals
# TODO: these aren't used anywhere, need to find out what they were here for
# locals {
#   log_analytics_workspace = {
#     law-primary-shared-key = azurerm_log_analytics_workspace.log_analytics_workspace.primary_shared_key
#     law-workspace-id       = azurerm_log_analytics_workspace.log_analytics_workspace.workspace_id
#     law-resource-id        = azurerm_log_analytics_workspace.log_analytics_workspace.id
#   }
# }

# Create a Log Analytics Workspace
#   Name format (scope: resource group, characters: 4-63 [alphanumeric, -]):
#     "<abbreviation>-<application_name>-<subscription_type>-<environment>-<location>-<instance_number>"
resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  # required
  name                = var.name_override != "" ? var.name_override : "${var.abbreviation}-${var.application_name}-${var.subscription_type}-${var.environment}-${var.location}"#-${var.instance_number}
  location            = var.location
  resource_group_name = var.resource_group_name
  # optional
  sku                 = var.sku
  retention_in_days   = var.retention_in_days
  tags                = var.tags
}

# Outputs
output "log_analytics_workspace" {
  value = azurerm_log_analytics_workspace.log_analytics_workspace
}
output "id" {
  value = azurerm_log_analytics_workspace.log_analytics_workspace.id
}
output "workspace_id" {
  value = azurerm_log_analytics_workspace.log_analytics_workspace.workspace_id
}
output "primary_shared_key" {
  value = azurerm_log_analytics_workspace.log_analytics_workspace.primary_shared_key
}
output "name" {
  value = azurerm_log_analytics_workspace.log_analytics_workspace.name
}
output "location" {
  value = azurerm_log_analytics_workspace.log_analytics_workspace.location
}