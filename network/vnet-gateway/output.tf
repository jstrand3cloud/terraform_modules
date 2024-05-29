output "public_ip" {
  value = azurerm_public_ip.this.ip_address
}

output "private_ip_address" {
  value = azurerm_virtual_network_gateway.this.ip_configuration.private_ip_address
}
