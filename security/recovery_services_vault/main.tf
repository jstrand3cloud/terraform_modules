resource "azurerm_recovery_services_vault" "vault" {
  name                = var.recovery_services_vault
  location            = var.location
  resource_group_name = var.recovery_services_vault_rg_name
  sku                 = var.recovery_services_vault_sku

  tags = var.tags
}

# resource "azurerm_backup_policy_vm" "this" {
#   name                = "az-prod-${var.client_abbr_name}-bkpol-001"
#   resource_group_name = var.Recovery_services_vault_rg_name
#   recovery_vault_name = azurerm_recovery_services_vault.vault.name

#   timezone = "UTC"

#   backup {
#     frequency = "Daily"
#     time      = "06:00"
#   }

#   retention_daily {
#     count = 30
#   }

#   # retention_weekly {
#   #   count    = 42
#   #   weekdays = ["Sunday", "Wednesday", "Friday", "Saturday"]
#   # }

#   # retention_monthly {
#   #   count    = 7
#   #   weekdays = ["Sunday", "Wednesday"]
#   #   weeks    = ["First", "Last"]
#   # }

#   # retention_yearly {
#   #   count    = 77
#   #   weekdays = ["Sunday"]
#   #   weeks    = ["Last"]
#   #   months   = ["January"]
#   # }
# }


/*

resource "azurerm_private_endpoint" "rsv" {
  name                = "${var.Recovery_services_vault}-backup-pe" #No API Rules or Naming Conventions around Azure Private Endpoints.  Build in name from KV
  location            = var.location
  resource_group_name = var.Recovery_services_vault_rg_name
  subnet_id           = var.rsv_subnet_id

  private_service_connection {
    name                           = "${var.Recovery_services_vault}-backup-pe"
    private_connection_resource_id = azurerm_recovery_services_vault.vault.id
    is_manual_connection           = false
    subresource_names              = ["AzureBackup"]
  }

  private_dns_zone_group {
    name                 = "${var.Recovery_services_vault}-zone-group"
    private_dns_zone_ids = var.rsv_dns_zone_id
  }

  tags = var.tags
}

*/