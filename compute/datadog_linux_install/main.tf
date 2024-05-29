resource "azurerm_virtual_machine_extension" "datadoginstall" {
    name = "datadog_install"
    virtual_machine_id = var.vm_id
    publisher = "Microsoft.Azure.Extensions"
    type = "CustomScript"
    type_handler_version = "2.0"
    protected_settings             = <<PROT
{
    "script": "${base64encode(templatefile("../../scripts/datadog-linux-install.tpl", { ENV = "${var.ENV}", CLIENT = "${var.CLIENT}"}))}"
}
PROT
}