variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = ""
}

variable "automation_account_name" {
  description = "Specifies the name of the Automation Account"
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
variable "location" {
    default = "eastus"
}

variable "runbook_name" {
  description = "The name of the runbook"
    default = ""
}

variable "log_verbose" {
  description = "Enable Log verbose records true or false"
  default = "false"
}

variable "log_progress" {
  description = "Enable Log progress records true or false"
  default = "false"
}

variable "runbook_description" {
  description = "Description for the runbook"
  default = "This is an example runbook"
}

variable "runbook_type" {
  description = "Type of runbook"
  default = "PowerShell"
}
variable "content" {}