resource "azurerm_local_network_gateway" "home" {
  name                = var.name            #"backHome"
  resource_group_name = var.resource_group  #azurerm_resource_group.example.name
  location            = var.location        #azurerm_resource_group.example.location
  gateway_address     = var.gateway_address #"12.13.14.15"
  address_space       = var.address_space   #["10.0.0.0/16"]
}
