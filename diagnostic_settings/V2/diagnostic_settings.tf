resource "azurerm_monitor_diagnostic_setting" "monitor_diagnostic_setting" {
  # required
  name                        = var.name
  target_resource_id          = var.resource_id
  # optional
  log_analytics_workspace_id  = var.log_analytics_workspace_id
  log_analytics_destination_type = var.log_analytics_destination_type 

  dynamic "enabled_log" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories.log_category_types)

    content {
      category = enabled_log.value
    }
  }

  dynamic "metric" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories.metrics)

    content {
      category = metric.value
      enabled  = !(contains(var.metrics_to_exclude, metric.value))
    }
  }

  lifecycle {
    ignore_changes = [metric]
  }
}
