variable "name" {
  type        = string
  description = "(Required) Specifies the name of the Log Analytics Workspace. Workspace name should include 4-63 letters, digits or '-'. The '-' shouldn't be the first or the last symbol. Changing this forces a new resource to be created."
}

variable "resource_group" {
  type        = string
  description = "(Required) The name of the resource group in which the Log Analytics workspace is created. Changing this forces a new resource to be created."
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}

variable "sku" {
  type        = string
  description = "(Optional) Specifies the SKU of the Log Analytics Workspace."

  validation {
    condition     = contains(["PerNode", "Premium", "Standard", "Standalone", "Unlimited", "PerGB2018"], var.sku)
    error_message = "This needs to match a supported Log Analytics Workspace SKU, other than Free."
  }
  default = "PerGB2018"
}

variable "retention_in_days" {
  type        = number
  description = "(Optional) The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730."
  validation {
    condition     = var.retention_in_days >= 30 && var.retention_in_days <= 730
    error_message = "This needs be a number between 30 and 730 or 7 for free sku."
  }
  default = 30
}

variable "daily_quota_gb" {
  type        = number
  description = "(Optional) The workspace daily quota for ingestion in GB. Defaults to -1 (unlimited) if omitted. When sku is set to Free this field should not be set and has a default value of 0.5. "
  default     = -1
}

variable "internet_ingestion_enabled" {
  type        = bool
  description = "(Optional) Should the Log Analytics Workspace support ingestion over the Public Internet? Defaults to false."
  default     = false
}

variable "internet_query_enabled" {
  type        = bool
  description = "(Optional) Should the Log Analytics Workspace support querying over the Public Internet? Defaults to false."
  default     = false
}

variable "reservation_capacity_in_gb_per_day" {
  type        = number
  description = "(Optional) The capacity reservation level in GB for this workspace. Must be in increments of 100 between 100 and 5000. can only be used when the sku is set to CapacityReservation."
  default     = null
}