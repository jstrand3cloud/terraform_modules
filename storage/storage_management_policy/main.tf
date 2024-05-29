resource "azurerm_storage_management_policy" "this" {
  storage_account_id = var.storage_account_id

  dynamic "rule" {
    for_each = var.lifecycle_management_policy
    content {
      name    = rule.value.policy_name     #"Delete_SQLBackups"
      enabled = rule.value.enabled #true


      dynamic "filters" {
        for_each = rule.value.filters
        content {
          prefix_match = filters.value.prefix_match #["sqlbackups/*"]
          blob_types   = filters.value.blob_types #["blockBlob"]
        }
      }

      dynamic "actions" {
        for_each = rule.value.actions
        content {
          base_blob {
            delete_after_days_since_creation_greater_than = actions.value.delete_after_days_since_creation_greater_than #32
          }
        }
      }
    }
  }
}