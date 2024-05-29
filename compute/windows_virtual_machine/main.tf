### Random Password Stored in SS Keyvault ###

resource "random_string" "local_password" {
  length           = var.passwordLength
  lower            = var.passwordLower
  upper            = var.passwordUpper
  numeric          = var.passwordNumber
  special          = var.passwordSpecial
  min_special      = var.min_special
  override_special = var.override_special
}

resource "azurerm_key_vault_secret" "randpass" {
  name         = join("-", [azurerm_windows_virtual_machine.this.name, "randpass"])
  value        = random_string.local_password.result
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "vm-username" {
  name         = join("-", [azurerm_windows_virtual_machine.this.name, "username"])
  value        = var.adminUser
  key_vault_id = var.key_vault_id
}

## Create Network Interface and NSG ##



resource "azurerm_network_interface" "this" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group
  dns_servers         = var.dns_servers

  ip_configuration {
    name                          = "${var.vm_name}-ip-configuration"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation #"Dynamic"
    private_ip_address            = var.static_ip_address
  }
  tags = var.tags
}




## Create Virtual Machine ##
resource "azurerm_windows_virtual_machine" "this" {
  name                = var.vm_name
  resource_group_name = var.resource_group
  location            = var.location
  size                = var.vm_size   #"Standard_F2"
  admin_username      = var.adminUser #"adminuser"
  admin_password      = random_string.local_password.result
  zone                = var.zone
  license_type        = var.license_type
  network_interface_ids = [
    azurerm_network_interface.this.id,
  ]

  os_disk {
    caching              = var.cache                #"ReadWrite"
    storage_account_type = var.storage_account_type #"Standard_LRS"
  }

  source_image_reference {
    publisher = var.publisher #"MicrosoftWindowsServer"
    offer     = var.offer     #"WindowsServer"
    sku       = var.sku       #"2016-Datacenter"
    version   = "latest"
  }
  boot_diagnostics {
    storage_account_uri = null
  }
  identity {
    type = "SystemAssigned"
  }
  tags = var.tags
}


## Create and Attach Data Disk ##

resource "azurerm_managed_disk" "this" {
  name                 = "${var.vm_name}-disk1"
  location             = azurerm_windows_virtual_machine.this.location
  resource_group_name  = azurerm_windows_virtual_machine.this.resource_group_name
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  disk_size_gb         = var.disk_size_gb
  zone                 = var.zone
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "this" {
  managed_disk_id    = azurerm_managed_disk.this.id
  virtual_machine_id = azurerm_windows_virtual_machine.this.id
  lun                = var.lun #"1"
  caching            = "None"
}



