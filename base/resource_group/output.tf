output "id" {
  description = "Resource ID of created resource group"
  value       = azurerm_resource_group.rg.id
}

output "name" {
  description = "Resource name of created resource group"
  value       = azurerm_resource_group.rg.name
}

output "location" {
  value = azurerm_resource_group.rg.location
}