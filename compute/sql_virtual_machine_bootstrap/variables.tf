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
  type        = string
  description = "Keyvault location to store randomized passwords"
}



variable "sql_vm_id" {}
variable "sql_admin_user" {
  default = "SQLAdmin"
}

variable sql_license_type {
  default = "AHUB"
}