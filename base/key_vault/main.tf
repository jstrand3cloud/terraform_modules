resource "azurerm_key_vault" "this" {
  name                       = var.key_vault_name
  location                   = var.location
  resource_group_name        = var.key_vault_resource_group_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = var.soft_delete_retention_days
  purge_protection_enabled   = var.purge_protection_enabled
  sku_name                   = var.key_vault_sku_name

  enable_rbac_authorization       = var.enable_rbac_authorization
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment

  tags = var.tags

  dynamic "contact" {
    for_each = var.contact
    content {
      email = contact.value["email"]
      name  = contact.value["name"]
      phone = contact.value["phone"]
    }
  }

  dynamic "network_acls" {
    for_each = var.key_vault_network_acls
    content {
      bypass                     = network_acls.value["bypass"]
      default_action             = network_acls.value["default_action"]
      ip_rules                   = network_acls.value["allowed_ip_rules"]
      virtual_network_subnet_ids = network_acls.value["allowed_virtual_network_subnet_ids"]
    }
  }

}

# resource "azurerm_key_vault_access_policy" "this" {
#   for_each = var.key_vault_default_access_policy
#   tenant_id    = var.tenant_id
#   object_id    = each.key
#   key_vault_id = azurerm_key_vault.this.id

#   certificate_permissions = each.value.certificate_permissions
#   key_permissions         = each.value.key_permissions
#   secret_permissions      = each.value.secret_permissions
#   storage_permissions     = each.value.storage_permissions
# }

