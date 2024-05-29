resource "azurerm_route_table" "this" {
  name                          = var.name
  location                      = var.location
  tags                          = var.tags
  resource_group_name           = var.resource_group
  disable_bgp_route_propagation = var.disable_bgp_route_propagation
}

resource "azurerm_route" "vnet-local" {
  depends_on = [
    azurerm_route_table.this
  ]
  for_each            = { for route in var.vnetlocal_routes : route.name => route }
  name                = each.value.name
  resource_group_name = var.resource_group
  route_table_name    = azurerm_route_table.this.name
  address_prefix      = each.value.address_prefix
  next_hop_type       = "VnetLocal"
}

resource "azurerm_route" "nva" {
  for_each               = { for route in var.nva_routes : route.name => route }
  name                   = each.value.name
  resource_group_name    = var.resource_group
  route_table_name       = azurerm_route_table.this.name
  address_prefix         = each.value.address_prefix
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = each.value.next_hop_ip
}

# resource "azurerm_subnet_route_table_association" "this" {
#   subnet_id      = var.subnet
#   route_table_id = azurerm_route_table.this.id
# }