output "id" {
  description = "Resource ID of created managed disk"
  value       = azurerm_windows_virtual_machine.this.id
}

output "sku" {
  description = "The type of sku being used for the virtual machine."
  value = azurerm_windows_virtual_machine.this.source_image_reference[0].sku
}

output "vm_principal_id" {
  value       = azurerm_windows_virtual_machine.this.identity.0.principal_id
  description = "The Principal ID of the VM's Managed Identities."
}

output "AdminUser" {
  value = var.adminUser
}

output "AdminPassword" {
  value = random_string.local_password.result
}