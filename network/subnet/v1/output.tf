output "subnets" {
  value = azurerm_subnet.subnets
}

output "subnets_id" {
  value = azurerm_subnet.subnets.id
}

output "address_prefixes" {
  value = azurerm_subnet.subnets.address_prefixes
}