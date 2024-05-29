resource "azurerm_virtual_machine_extension" "domjoin" {
  name                 = "domain_join"
  virtual_machine_id   = var.vm_id
  publisher            = "Microsoft.Compute"
  type                 = "JsonADDomainExtension"
  type_handler_version = "1.3"
  # What the settings mean: https://docs.microsoft.com/en-us/windows/desktop/api/lmjoin/nf-lmjoin-netjoindomain
  settings           = <<SETTINGS
{
"Name": "azure.w-energy.net",
"OUPath": "", 
"User": "azure.w-energy.net\\domainjoin",
"Restart": "true",
"Options": "3"
}
SETTINGS
  protected_settings = <<PROTECTED_SETTINGS
{
"Password": "${var.admin_password}"
}
PROTECTED_SETTINGS
}


# resource "ad_ou" "o" { 
#     name = "gplinktestOU"
#     path = "dc=yourdomain,dc=com"
#     description = "OU for gplink tests"
#     protected = false
# }


#OU Path
#OU=Servers,DC=azure,DC=w-energy,DC=net