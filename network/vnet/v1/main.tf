resource "azurerm_virtual_network" "this" {

  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group
  address_space       = var.cidr
  dns_servers         = var.dns_servers
  tags                = var.tags
}
