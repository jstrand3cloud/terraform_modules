variable "vm_name" {
  type        = string
  description = "The name of the Windows Virtual Machine. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "The Azure location where the Windows Virtual Machine should exist"
}

variable "resource_group" {
  type        = string
  description = "The name of the Resource Group in which the Windows Virtual Machine should be exist. Changing this forces a new resource to be created."
}

variable "subnet_id" {
  type        = string
  description = ""
}

variable "private_ip_address_allocation" {
  type        = string
  description = "The allocation method used for the Private IP Address. Possible values are Dynamic and Static."
  default     = "Dynamic"

}

variable "vm_size" {
  type        = string
  description = "The SKU which should be used for this Virtual Machine, such as Standard_F2."
}

variable "os_disk_id" {}
variable "data_disk_00_id" {}
variable "data_disk_01_id" {}



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

# variable "key_vault_id" {}



variable "adminUser" {
  type        = string
  description = "Admin username"
  default     = "azwenergyadmin"
}

# variable "dns_servers" {}
variable "tags" {}
# variable "domain_join_password" {}
# variable "templatedata" {} 