resource "random_string" "local_password" {
  length           = var.passwordLength
  lower            = var.passwordLower
  upper            = var.passwordUpper
  numeric          = var.passwordNumber
  special          = var.passwordSpecial
  min_special      = var.min_special
  override_special = var.override_special
}

resource "azurerm_managed_disk" "osdisk" {
  name                 = "${var.vm_name}-osdisk"
  location             = var.location
  resource_group_name  = var.resource_group 
  storage_account_type = "StandardSSD_LRS"
  create_option        = "Copy"
  source_resource_id   = var.os_disk_id 
  disk_size_gb         = 31
  hyper_v_generation   = "V1"
  os_type              = "Linux"
}


resource "azurerm_managed_disk" "datadisk00" {
  name                 = "${var.vm_name}-datadisk00"
  location             = var.location
  resource_group_name  = var.resource_group
  storage_account_type = "StandardSSD_LRS"
  create_option        = "Copy"
  source_resource_id   = var.data_disk_00_id 
  disk_size_gb         = 25
}

resource "azurerm_managed_disk" "datadisk01" {
  name                 = "${var.vm_name}-datadisk01"
  location             = var.location
  resource_group_name  = var.resource_group
  storage_account_type = "StandardSSD_LRS"
  create_option        = "Copy"
  source_resource_id   = var.data_disk_01_id 
  disk_size_gb         = 5
}

resource "azurerm_network_interface" "this" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group


  ip_configuration {
    name                          = "${var.vm_name}-ip-configuration"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation 
  }
  tags = var.tags
}

resource "azurerm_virtual_machine" "main" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.resource_group
  network_interface_ids = [azurerm_network_interface.this.id]
  vm_size               = var.vm_size 


  storage_os_disk {
    name            = "${var.vm_name}-osdisk"
    create_option   = "Attach"
    managed_disk_id = azurerm_managed_disk.osdisk.id
    os_type         = "Linux"
  }
  plan {
    name      = "centos-7"
    publisher = "procomputers"
    product   = "centos-7"
  }
  

  os_profile_linux_config {
    disable_password_authentication = false    
  }

  
  depends_on = [azurerm_marketplace_agreement.centos]
}

resource "azurerm_virtual_machine_data_disk_attachment" "cmb_datadisk00" {
  managed_disk_id    = azurerm_managed_disk.datadisk00.id
  virtual_machine_id = azurerm_virtual_machine.main.id
  lun                = 0
  caching            = "None"
}

resource "azurerm_virtual_machine_data_disk_attachment" "cmb_datadisk01" {
  managed_disk_id    = azurerm_managed_disk.datadisk01.id
  virtual_machine_id = azurerm_virtual_machine.main.id
  lun                = 1
  caching            = "None"
}