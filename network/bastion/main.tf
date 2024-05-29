resource "azurerm_public_ip" "this" {
  name                = "${var.bastion_name}-pip"
  location            = var.location
  resource_group_name = var.resource_group
  allocation_method   = var.allocation_method # "Static"
  sku                 = var.pip_sku           #"Standard"
}

resource "azurerm_bastion_host" "example" {
  name                = var.bastion_name
  location            = var.location
  resource_group_name = var.resource_group
  copy_paste_enabled  = var.copy_paste_enabled
  file_copy_enabled   = var.file_copy_enabled
  sku                 = var.bastion_sku

  ip_configuration {
    name                 = "${var.bastion_name}-configuration"
    subnet_id            = var.bastion_subnet
    public_ip_address_id = azurerm_public_ip.this.id
  }
}