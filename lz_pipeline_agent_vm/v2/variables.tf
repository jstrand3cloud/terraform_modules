variable "location" {}
#variable "instance_number" {}
variable "resource_group_name" {}

variable "vm_name" {
  type        = string
  description = "The name of the Windows Virtual Machine. Changing this forces a new resource to be created."
}

variable "subnet_id" {
  type        = string
  description = ""
}

variable "size" {
  default = "Standard_B2S"
}

variable "storage_account_type" {
  type        = string
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS, Premium_LRS, StandardSSD_ZRS and Premium_ZRS. Changing this forces a new resource to be created."
  default     = "Standard_SSD"
}

variable "private_ip_address_allocation" {
  type        = string
  description = "The allocation method used for the Private IP Address. Possible values are Dynamic and Static."
}

# variable "log_analytics_workspace_id" {}
# variable "log_analytics_workspace_workspace_id" {}
# variable "log_analytics_workspace_key" {}
variable "tags" {}

variable "encryption_at_host_enabled" {
  default = false
}
variable "enable_ip_forwarding" {
  default = false
}

variable "license_type" {
  default = "Windows_Server"
}

variable "passwordLength" {
  type        = number
  description = "Required password length to meet security minimum"
  default     = 12
}

variable "passwordLower" {
  type        = bool
  description = "Are lower characters required?"
  default     = true
}

variable "passwordUpper" {
  type        = bool
  description = "Are Upper characters required?"
  default     = true
}

variable "passwordNumber" {
  type        = bool
  description = "Are numbers required in the password?"
  default     = true
}

variable "passwordSpecial" {
  type        = bool
  description = "Are special characters required in the password?"
  default     = true
}

variable "min_special" {
  type        = number
  description = "Number of special characters required."
  default     = 1
}

variable "override_special" {
  type        = string
  description = "Special characters to use for randomized password"
  default     = "*!@#?"

}

variable "key_vault_id" {
    type = string
    description = "Keyvault location to store randomized passwords"
}

variable "adminUser" {
  type        = string
  description = "Admin username"
  default     = "azchoaadmin"
}

variable "adminPassword" {
  type        = string
  description = "Admin password"
  default     = "R@nd0mPassw0rd$989$"
}