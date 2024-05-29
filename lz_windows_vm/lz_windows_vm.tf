# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       #version = ">= 3.0.2"
#       version = "~> 3.76.0" # For production grade
#     }
#   }
#   required_version = ">= 1.1.0"
# }

# TODO: this module needs to be updated to the standards of other modules

variable "application_name" {}
variable "subscription_type" {}
variable "environment" {}
variable "location" {}
#variable "instance_number" {}
variable "resource_group_name" {}
variable "vm_type" {}
variable "vm_subnet_id" {}
variable "username" {}
variable "password" {}
variable "size" {
  default = "Standard_B2S"
}
# variable "log_analytics_workspace_id" {}
# variable "log_analytics_workspace_workspace_id" {}
# variable "log_analytics_workspace_key" {}
variable "tags" {}

variable "encryption_at_host_enabled" {
  default = false
}
variable "enable_ip_forwarding" {
  default = false
}

# Generate Random IDs for use in a unique name
resource "random_id" "vm" {
  keepers = {
    group_name = var.resource_group_name
  }
  byte_length = 2 # NOTE: A hex string will be twice as long as the byte_length
}

resource "azurerm_network_interface" "vm-nic" {
    name                 = "nic-vm${var.vm_type}${random_id.vm.hex}-${var.subscription_type}-${var.vm_type}-${var.location}" #-${var.instance_number}"
    location             = var.location
    resource_group_name  = var.resource_group_name
    enable_ip_forwarding = var.enable_ip_forwarding

    ip_configuration {
      name                          = "ip-vm${var.vm_type}${random_id.vm.hex}-${var.subscription_type}-${var.vm_type}-${var.location}" #-${var.instance_number}"
      subnet_id                     = var.vm_subnet_id
      private_ip_address_allocation = "Dynamic"
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
resource "azurerm_windows_virtual_machine" "Lz_VM" {
  name                        = "vm${var.subscription_type}${var.vm_type}${random_id.vm.hex}"
  resource_group_name         = var.resource_group_name
  location                    = var.location
  size                        = var.size # "Standard_B2S"
  admin_username              = var.username
  admin_password              = var.password
  provision_vm_agent          = true
  allow_extension_operations  = true
  network_interface_ids       = [azurerm_network_interface.vm-nic.id]
  encryption_at_host_enabled  = var.encryption_at_host_enabled

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
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