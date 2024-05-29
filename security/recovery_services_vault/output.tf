# output "dns_configs" {
#     value = azurerm_private_endpoint.rsv.custom_dns_configs
# }

output "rsv_name" {
  value = azurerm_recovery_services_vault.vault.name
}