resource "azurerm_backup_policy_vm" "policy" {
  name                = var.backup_policy_name #"${local.resource_prefix}-bkpol-vms"
  resource_group_name = var.bp_resource_group_name
  recovery_vault_name = var.recovery_vault_name
  policy_type         = var.backup_policy_type != null ? var.backup_policy_type : "V2"

  timezone = var.backup_policy_time_zone != null ? var.backup_policy_time_zone : "UTC"

  backup {
    frequency = var.backup_policy_frequency != null ? var.backup_policy_frequency : "Daily"
    time      = var.backup_policy_time != null ? var.backup_policy_time : "23:00"
  }

  dynamic "retention_daily" {
    for_each = var.backup_policy_retention_daily_count != "" ? [1] : []

    content {
      count = var.backup_policy_retention_daily_count
    }
  }

  dynamic "retention_weekly" {
    for_each = var.backup_policy_retention_weekly_count != "" ? [1] : []

    content {
      count = var.backup_policy_retention_weekly_count
      weekdays = var.backup_policy_retention_weekly_weekdays != null ? var.backup_policy_retention_weekly_weekdays : [ "Saturday" ]
    }
  }

  dynamic "retention_monthly" {
    for_each = var.backup_policy_retention_monthly_count != "" ? [1] : []

    content {
      count = var.backup_policy_retention_monthly_count
      weekdays  = var.backup_policy_retention_monthly_weekdays != null ? var.backup_policy_retention_monthly_weekdays : [ "Saturday" ]
      weeks     = [ "Last" ]
    }
  }  

#   timeouts {
#     create  = local.timeout_create
#     delete  = local.timeout_delete
#     read    = local.timeout_read
#   }
}