### Random Password Stored in SS Keyvault ###

# resource "random_string" "local_password" {
#   length           = var.passwordLength
#   lower            = var.passwordLower
#   upper            = var.passwordUpper
#   numeric          = var.passwordNumber
#   special          = var.passwordSpecial
#   min_special      = var.min_special
#   override_special = var.override_special
# }

# resource "azurerm_key_vault_secret" "randpass" {
#   name         = join("-", [azurerm_windows_virtual_machine.this.name, "randpass"])
#   value        = random_string.local_password.result
#   key_vault_id = var.key_vault_id
# }

# resource "azurerm_key_vault_secret" "vm-username" {
#   name         = join("-", [azurerm_windows_virtual_machine.this.name, "username"])
#   value        = var.adminUser
#   key_vault_id = var.key_vault_id
# }


# Generate Random IDs for use in a unique name
# resource "random_id" "vm" {
#   keepers = {
#     group_name = var.resource_group_name
#   }
#   byte_length = 2 # NOTE: A hex string will be twice as long as the byte_length
# }

resource "azurerm_network_interface" "vm-nic" {
    name                 = "nic-${var.vm_name}" #-${var.instance_number}"
    location             = var.location
    resource_group_name  = var.resource_group_name
    enable_ip_forwarding = var.enable_ip_forwarding

    ip_configuration {
      name                          = "ip-${var.vm_name}" #-${var.instance_number}"
      subnet_id                     = var.subnet_id
      private_ip_address_allocation = var.private_ip_address_allocation
    }
    tags                          = var.tags
}

# module "nic_diagnostic_settings" {
#   source                      = "../diagnostic_settings"
#   #name_override               = "ds-nicmdeXXXX-conn-dev-eastus-001"
#   application_name            = "nicvm${var.vm_type}${random_id.vm.hex}"
#   subscription_type           = var.subscription_type       
#   environment                 = var.environment              
#   location                    = var.location          
#   #instance_number             = var.instance_number   
#   resource_id                 = azurerm_network_interface.vm-nic.id
#   log_analytics_workspace_id  = var.log_analytics_workspace_id
#   logs_to_exclude             = []
#   metrics_to_exclude          = []
#   retention_days              = "7"
# }

# Computer name can be up to 15 characters
resource "azurerm_windows_virtual_machine" "this" {
  name                        = var.vm_name #"vm${var.subscription_type}${var.vm_type}" #${random_id.vm.hex}"
  resource_group_name         = var.resource_group_name
  location                    = var.location
  size                        = var.size # "Standard_B2S"
  admin_username = var.adminUser
  admin_password = var.adminPassword #random_string.local_password.result
#   admin_username              = var.username
#   admin_password              = var.password
  provision_vm_agent          = true
  allow_extension_operations  = true
  network_interface_ids       = [azurerm_network_interface.vm-nic.id]
  encryption_at_host_enabled  = var.encryption_at_host_enabled
  license_type                = var.license_type

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
  lifecycle {
    ignore_changes = [size]
  }

}

# This extension is needed for other extensions
# resource "azurerm_virtual_machine_extension" "daa-agent" {
#   name                       = "DependencyAgentWindows"
#   virtual_machine_id         = azurerm_windows_virtual_machine.Lz_VM.id
#   publisher                  = "Microsoft.Azure.Monitoring.DependencyAgent"
#   type                       = "DependencyAgentWindows"
#   type_handler_version       = "9.10"
#   automatic_upgrade_enabled  = true
#   auto_upgrade_minor_version = true
# }

# Add logging and monitoring extensions
# resource "azurerm_virtual_machine_extension" "monitor-agent" {
  
#   name                        = "AzureMonitorWindowsAgent"
#   virtual_machine_id          = azurerm_windows_virtual_machine.Lz_VM.id
#   publisher                   = "Microsoft.Azure.Monitor"
#   type                        = "AzureMonitorWindowsAgent"
#   type_handler_version        =  "1.5"
#   automatic_upgrade_enabled   = true
#   auto_upgrade_minor_version  = true
#   depends_on                  = [ azurerm_virtual_machine_extension.daa-agent ]
# }

# resource "azurerm_virtual_machine_extension" "omsagentwin" {
#   name                        = "OmsAgentForWindows"
#   virtual_machine_id          = azurerm_windows_virtual_machine.Lz_VM.id
#   publisher                   = "Microsoft.EnterpriseCloud.Monitoring"
#   type                        = "MicrosoftMonitoringAgent"
#   type_handler_version        = "1.0"
#   auto_upgrade_minor_version  = true

#   settings = <<SETTINGS
#     {
#       "workspaceId": "${var.log_analytics_workspace_workspace_id}",
#       "azureResourceId": "${azurerm_windows_virtual_machine.Lz_VM.id}",
#       "stopOnMultipleConnections": "false"
#     }
#   SETTINGS

#   protected_settings = <<PROTECTED_SETTINGS
#     {
#     "workspaceKey": "${var.log_analytics_workspace_key}"
#     }
#   PROTECTED_SETTINGS
# }

# resource "azurerm_virtual_machine_extension" "gc" {
#   name                       = "AzurePolicyforWindows"
#   virtual_machine_id         = azurerm_windows_virtual_machine.Lz_VM.id
#   publisher                  = "Microsoft.GuestConfiguration"
#   type                       = "ConfigurationforWindows"
#   type_handler_version       = "1.0"
#   auto_upgrade_minor_version = true
# }

# module "vm_diagnostic_settings" {
#   source                      = "../diagnostic_settings"
#   #name_override               = "ds-vmXXXX-conn-dev-eastus-001"
#   application_name            = "vm${var.vm_type}${random_id.vm.hex}"
#   subscription_type           = var.subscription_type       
#   environment                 = var.environment              
#   location                    = var.location          
#   #instance_number             = var.instance_number   
#   resource_id                 = azurerm_windows_virtual_machine.Lz_VM.id
#   log_analytics_workspace_id  = var.log_analytics_workspace_id
#   logs_to_exclude             = []
#   metrics_to_exclude          = []
#   retention_days              = "7"
# }