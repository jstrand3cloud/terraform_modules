
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
  name         = join("-", [var.sql_admin_user, "randpass"])
  value        = random_string.local_password.result
  key_vault_id = var.key_vault_id
}

resource "azurerm_mssql_virtual_machine" "example" {
  virtual_machine_id               = var.sql_vm_id
  sql_license_type                 = var.sql_license_type #"AHUB"
  r_services_enabled               = false
  sql_connectivity_port            = 1433
  sql_connectivity_update_password = random_string.local_password.result
  sql_connectivity_update_username = var.sql_admin_user
}


locals {
  customScriptPowershellUri = "https://weprdeustfsa.blob.core.windows.net/scripts/SQLServerConfig.ps1"
  sastoken                  = "?sp=r&st=2023-10-26T14:25:15Z&se=2024-02-29T23:25:15Z&spr=https&sv=2022-11-02&sr=b&sig=Bz0eg1nsySLbAyliePGj5pPIiyneAL%2FDRp8G3p1fWAM%3D"
}

resource "azurerm_virtual_machine_extension" "powershell-extension" {
  name                 = "SQLBaseline-Extension"
  virtual_machine_id   = var.sql_vm_id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"
  settings             = <<SETTINGS
{
"fileUris": [
"${local.customScriptPowershellUri}${local.sastoken}"
],
"commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -File SQLServerConfig.ps1 -AdminUser ${var.sql_admin_user} -AdminPassword ${random_string.local_password.result} -SaPassword ${random_string.local_password.result}"
}
SETTINGS

depends_on = [ azurerm_mssql_virtual_machine.example ]
}