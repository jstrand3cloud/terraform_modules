resource "azurerm_private_dns_zone" "this" {
  name                = var.private_dns_zone_name
  resource_group_name = var.zone_resource_group_name
  tags                = var.tags
}
