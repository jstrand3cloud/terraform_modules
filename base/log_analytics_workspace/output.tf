output "id" {
  description = "Log Analytics Workspace Resource Id"
  value       = azurerm_log_analytics_workspace.this.id
}

output "log_analytics_workspace_workspace_id" {
  description = "Log Analytics Workspace Workspace Id"
  value       = azurerm_log_analytics_workspace.this.workspace_id
}