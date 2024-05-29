# Service Abbreviations
variable "abbreviation" {
  type    = string
  default = "ds"
}

# Required
variable "name" {
  type        = string
  description = "(Required) Diagnostics Setting Name"
  default     = "ds"
}
variable "resource_id" {
  type        = string
  description = "(Required) Resource ID of diagnotics to be enabled"
}

# Optional
variable "log_analytics_workspace_id" {
  type        = string
  description = "(Optional) Log Analytics Workspace ID where diagnotics will be logged to"
}
variable "log_analytics_destination_type" {
  description = "(Optional) Choose from AzureDiagnostics or Dedicated"
  default = null
}
variable "retention_days" {
  default = 7
}
variable "logs_to_exclude" {
  default = []
}
variable "metrics_to_exclude" {
  default = []
}