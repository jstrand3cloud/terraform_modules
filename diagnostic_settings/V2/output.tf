output "id" {
  value = azurerm_monitor_diagnostic_setting.monitor_diagnostic_setting.id
  description = "The ID of the Diagnostic Setting"
}
output "monitor_diagnostic_setting" {
  value = azurerm_monitor_diagnostic_setting.monitor_diagnostic_setting
}
