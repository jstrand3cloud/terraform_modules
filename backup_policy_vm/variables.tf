variable "backup_policy_name" {
  description = "The display name of the Backup Policy to be created"
  type        = string
  nullable    = false
}

variable "bp_resource_group_name" {
  description = "The name of the resource group of the Backup Policy to be created"
  type        = string
  nullable    = false
}

variable "recovery_vault_name" {
  description = "The name of the Recovery Vault that the Backup Policy will be assigned to"
  type        = string
  nullable    = false
}

variable "backup_policy_type" {
  description = "(Optional) Indicates which version type to use when creating the backup policy"
  default     = "V2"

  validation {
    condition = contains(["V1","V2"], var.backup_policy_type)
    error_message = "The value must be set to one of the following: V1, V2"
  }
}

variable "backup_policy_time_zone" {
  description = "(Optional) Indicates the timezone that the policy will use"
  default     = "UTC"
}

variable "backup_policy_frequency" {
  description = "(Optional) Indicate the fequency to use for the backup policy"
  default     = "Daily"

  validation {
    condition = contains(["Daily"], var.backup_policy_frequency)
    error_message = "The value must be set to one of the following: Daily"
  }
}

variable "backup_policy_time" {
  description = "(Optional) Indicates the time for when to execute the backup policy"
  default     = "23:00"
}

variable "backup_policy_retention_daily_count" {
  description = "(Optional) Indicates the number of daily backups to retain (set to blank to disable)"
  type        = number
  default     = 7
}

variable "backup_policy_retention_weekly_count" {
  description = "(Optional) Indicates the number of weekly backups to retain (set to blank to disable)"
  type        = number
  default     = 4
}

variable "backup_policy_retention_weekly_weekdays" {
  description = "(Optional) Indicates which days of the week the weekly backup will be taken"
  type        = set(string)
  default     = [ "Saturday" ]

  validation {
    condition = can([for s in var.backup_policy_retention_weekly_weekdays : contains([ "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" ], s)])
    error_message = "The value must contain one of the following: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday"
  }
}

variable "backup_policy_retention_monthly_count" {
  description = "(Optional) Indicates the number of monthly backups to retain (set to blank to disable)"
  type        = number
  default     = 6
}

variable "backup_policy_retention_monthly_weekdays" {
  description = "(Optional) Indicates which days of the week the monthly backup will be taken"
  type        = set(string)
  default     = [ "Saturday" ]

  validation {
    condition = can([for s in var.backup_policy_retention_monthly_weekdays : contains([ "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" ], s)])
    error_message = "The value must contain one of the following: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday"
  }
}