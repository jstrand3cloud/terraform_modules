locals {
  dns_zone_instance_name = split(".", data.azurerm_private_dns_zone.this.name)[0]
  vnet_link_name         = "${data.azurerm_virtual_network.this.name}-${data.azurerm_resource_group.dns_zone_rg.name}-${local.dns_zone_instance_name}"
}

resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  name                  = local.vnet_link_name
  resource_group_name   = data.azurerm_resource_group.dns_zone_rg.name
  private_dns_zone_name = data.azurerm_private_dns_zone.this.name
  virtual_network_id    = var.virtual_network_id #data.azurerm_virtual_network.this.id
  registration_enabled  = var.is_autoregistered
}