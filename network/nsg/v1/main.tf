resource "azurerm_network_security_group" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group

  tags = var.tags
}

resource "azurerm_network_security_rule" "this" {
  for_each = { for rule in var.security_rules : rule.name => rule }

  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = azurerm_network_security_group.this.resource_group_name

  access                                     = each.value.access
  description                                = each.value.description
  destination_address_prefix                 = each.value.destination_address_prefix
  destination_application_security_group_ids = each.value.destination_application_security_group_ids
  destination_port_range                     = each.value.destination_port_range
  direction                                  = each.value.direction
  name                                       = each.value.name
  priority                                   = each.value.priority
  protocol                                   = each.value.protocol
  source_address_prefix                      = each.value.source_address_prefix
  source_port_range                          = each.value.source_port_range
}
/*
resource "azurerm_subnet_network_security_group_association" "this" {

  subnet_id                 = var.subnet
  network_security_group_id = azurerm_network_security_group.this.id
}
*/