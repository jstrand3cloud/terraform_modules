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
}

variable "vm_size" {
  type        = string
  description = "The SKU which should be used for this Virtual Machine, such as Standard_F2."
}

variable "cache" {
  type        = string
  description = "The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite."
}

variable "storage_account_type" {
  type        = string
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS, Premium_LRS, StandardSSD_ZRS and Premium_ZRS. Changing this forces a new resource to be created."
  default     = "Standard_SSD"
}

variable "publisher" {
  type        = string
  description = "Specifies the Publisher of the Marketplace Image this Virtual Machine should be created from. Changing this forces a new resource to be created."
}

variable "offer" {
  type        = string
  description = "Specifies the offer of the image used to create the virtual machines. Changing this forces a new resource to be created."
}

variable "sku" {
  type        = string
  description = "Specifies the SKU of the image used to create the virtual machines. Changing this forces a new resource to be created."
}

variable "zone" {
  type        = string
  description = "Specifies the Availability Zone in which this Windows Virtual Machine should be located"
}

variable "license_type" {
  type    = string
  default = "Windows_Server"
}

variable "disk_size_gb" {
  type    = number
  default = 100
}

variable "create_option" {
  type    = string
  default = "Empty"
}

variable "caching" {
  type    = string
  default = "None"
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

variable "key_vault_id" {}


variable "lun" {
  type        = string
  description = "Lun to attach data disk."
}

variable "adminUser" {
  type        = string
  description = "Admin username"
  default     = "azwenergyadmin"
}

variable "disk_caching" {}

variable "dns_servers" {}
variable "static_ip_address" {}
variable "tags" {}