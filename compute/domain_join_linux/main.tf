resource "azurerm_virtual_machine_extension" "domainjoin" {
  name                 = "Linux-Domainjoin"
  virtual_machine_id   = var.vm_id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"
  protected_settings             = <<PROT
{
    "script": "${base64encode(templatefile("../../scripts/domainjoin.tpl", { vmname = "${var.vmname}", DJPASS = "${var.DJPASS}" , DJUSER = "domainjoin", ENV = "${var.ENV}", CLIENT = "${var.CLIENT}" }))}"
}
PROT
}