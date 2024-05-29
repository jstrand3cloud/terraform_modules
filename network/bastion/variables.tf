variable "bastion_name" {
  type        = string
  description = "Specifies the name of the Bastion Host. Changing this forces a new resource to be created"
}
variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}
variable "resource_group" {
  type        = string
  description = "The name of the resource group in which to create the Bastion Host. Changing this forces a new resource to be created."
}
variable "allocation_method" {
  type        = string
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic."
  default     = "Static"
}
variable "pip_sku" {
  type        = string
  description = "The SKU of the Public IP. Accepted values are Basic and Standard."
  default     = "Standard"
}
variable "bastion_subnet" {
  type        = string
  description = "Reference to a subnet in which this Bastion Host has been created."
}
variable "copy_paste_enabled" {
  type        = string
  description = " Is Copy/Paste feature enabled for the Bastion Host."
  default     = "true"
}
variable "file_copy_enabled" {
  type        = string
  description = "Is File Copy feature enabled for the Bastion Host."
  default     = "false"
}
variable "bastion_sku" {
  type        = string
  description = "The SKU of the Bastion Host. Accepted values are Basic and Standard"
  default     = "Basic"
}

