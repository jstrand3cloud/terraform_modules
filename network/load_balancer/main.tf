resource "azurerm_lb" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group
  tags                = var.tags
  sku                 = "Standard" #Default to Standard
  sku_tier            = "Regional"

  frontend_ip_configuration {
    name                          = "${var.name}-internal-fe-ip-config"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address_version    = "IPv4"
    private_ip_address            = var.frontend_ip_address #cidrhost(var.vnet.az-corp-prd-asea-ss-vnet-01.subnets.az-corp-prd-asea-ss-fwinternal-snet.address_prefixes[0], 5)
  }
}



## Backend Address Pool ## 
resource "azurerm_lb_backend_address_pool" "this" {
  loadbalancer_id = azurerm_lb.this.id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_backend_address_pool_address" "fortigate-backend" {
  name                                = "internal-fortigate"
  backend_address_pool_id             = azurerm_lb_backend_address_pool.this.id
  backend_address_ip_configuration_id = azurerm_lb.this.frontend_ip_configuration[0].id
}


## Health Probe ##
resource "azurerm_lb_probe" "this" {
  loadbalancer_id = azurerm_lb.this.id
  name            = "ssh-running-probe"
  port            = 22
}

/*
resource "azurerm_lb_outbound_rule" "this" {
  name                    = "OutboundRule"
  loadbalancer_id         = azurerm_lb.this.id
  protocol                = "Tcp"
  backend_address_pool_id = azurerm_lb_backend_address_pool.this.id

  frontend_ip_configuration {
    name = "PublicIPAddress"
  }
}
*/