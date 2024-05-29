resource "azurerm_public_ip" "this" {
  name                = "${var.vnet_gateway_name}-pip"
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = "Standard"
  allocation_method   = "Static"
}


resource "azurerm_virtual_network_gateway" "this" {
  name                       = var.vnet_gateway_name
  location                   = azurerm_public_ip.this.location
  resource_group_name        = azurerm_public_ip.this.resource_group_name
  private_ip_address_enabled = false


  type     = var.gateway_type #"ExpressRoute"
  vpn_type = var.vpn_type

  active_active = var.active_active
  enable_bgp    = var.enable_bgp
  sku           = var.sku
  generation    = var.generation

  ip_configuration {
    name                          = "${var.vnet_gateway_name}-GatewayConfig"
    public_ip_address_id          = azurerm_public_ip.this.id
    private_ip_address_allocation = var.ip_configuration_private_ip_allocation
    subnet_id                     = var.gateway_subnet_id
  }

  default_local_network_gateway_id = var.default_local_network_gateway_id

  # vpn_client_configuration {
  #   address_space = [var.vpn_client_configuration_address_space]
  # }
}