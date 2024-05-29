data "azurerm_client_config" "current" {}

# Get existing resource IDs for Azure Monitor diagnostic categories
data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories" {
  resource_id = var.resource_id
}