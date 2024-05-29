resource "azurerm_network_security_group" "this" {
  name                = "${var.vm_name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}


resource "azurerm_network_interface" "this" {
  name                = "${var.vm_name}-nic"
  location            = azurerm_network_security_group.this.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.vm_name}-ip-configuration"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation #"Dynamic"
  }
}

resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "azurerm_key_vault_secret" "myprivateSshKey" {
  name         = join("-", [var.vm_name, "privkey"])
  value        = tls_private_key.key.private_key_pem
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "mypublicSshKey" {
  name         = join("-", [var.vm_name, "pubkey"])
  value        = tls_private_key.key.public_key_pem
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "breakglassadmin" {
  name         = join("-", [var.vm_name, "username"])
  value        = var.local_admin_username
  key_vault_id = var.key_vault_id
}




resource "azurerm_linux_virtual_machine" "vm" {
  name                            = var.vm_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  size                            = var.vm_size
  admin_username                  = var.local_admin_username
  license_type                    = var.license_type
  disable_password_authentication = true


  network_interface_ids = [
    azurerm_network_interface.this.id,
  ]

  additional_capabilities {
    ultra_ssd_enabled = var.ultra_ssd_enabled
  }

  admin_ssh_key {
    username   = var.local_admin_username
    public_key = tls_private_key.key.public_key_openssh
  }

  os_disk {
    caching              = var.osdiskcaching
    storage_account_type = var.vm_osdisktype
  }
  source_image_reference {
    publisher = var.vm_image_id == null ? var.vm_publisher : null
    offer     = var.vm_image_id == null ? var.vm_offer : null
    sku       = var.vm_image_id == null ? var.vm_sku : null
    version   = var.vm_image_id == null ? var.vm_version : null
  }

  tags = var.tags

}
