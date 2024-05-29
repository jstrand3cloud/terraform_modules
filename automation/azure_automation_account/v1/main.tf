#--------------------------------------
# Resource Group and other resoruces
#--------------------------------------
# data "azurerm_resource_group" "rg" {
#   name = var.resource_group_name
# }

# data "azurerm_log_analytics_workspace" "logws" {
#   count               = var.log_analytics_workspace_name != null ? 1 : 0
#   name                = var.log_analytics_workspace_name
#   resource_group_name = data.azurerm_resource_group.rg.name
# }

# data "azurerm_storage_account" "storeacc" {
#   count               = var.hub_storage_account_name != null ? 1 : 0
#   name                = var.hub_storage_account_name
#   resource_group_name = data.azurerm_resource_group.rg.name
# }

#---------------------------------
# Azure Automation Account
#---------------------------------
resource "azurerm_automation_account" "aauto" {
  name                = var.automation_account_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
  tags                = var.tags
}

