resource "azurerm_recovery_services_vault" "recovery_services_vault" {
  name                          = var.recovery_services_vault_name
  location                      = var.location
  resource_group_name           = var.rsv_resource_group_name
  sku                           = var.vault_sku
  storage_mode_type             = var.storage_mode_type
  public_network_access_enabled = var.rsv_public_network_access_enabled
  tags                          = var.tags
}