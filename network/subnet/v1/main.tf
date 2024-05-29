resource "azurerm_subnet" "subnets" {
  name                                      = var.subnet_name
  resource_group_name                       = var.resource_group
  virtual_network_name                      = var.vnet_name
  address_prefixes                          = var.subnet_range
  service_endpoints                         = var.service_endpoints
  private_endpoint_network_policies_enabled = var.enforce_private_link_endpoint_network_policies

  dynamic "delegation" {
    for_each = var.delegation_name != null ? [1] : []

    content {
      name = "delegation"

      service_delegation {
        name    = var.delegation_name
        actions = var.delegation_actions
      }
    }
  }
}
