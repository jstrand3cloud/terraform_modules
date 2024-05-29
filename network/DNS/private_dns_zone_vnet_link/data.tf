data "azurerm_resource_group" "dns_zone_rg" {
  name = var.dns_zone_rg_name
}

data "azurerm_private_dns_zone" "this" {
  name                = var.dns_zone_name
  resource_group_name = data.azurerm_resource_group.dns_zone_rg.name
}

data "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  resource_group_name = var.vnet_rg_name
}