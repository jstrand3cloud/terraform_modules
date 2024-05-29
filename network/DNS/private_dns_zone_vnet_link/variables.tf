## Module Properties ##

variable "dns_zone_rg_name" {
  description = "The name of the Resource Group Containing the DNS Zone being linked"
  type        = string
}

variable "dns_zone_name" {
  description = "The name of the Private DNS Zone being linked"
  type        = string
}

variable "vnet_name" {
  description = "The name of the VNET being linked"
  type        = string
}

variable "vnet_rg_name" {
  description = "The name of the Resource Group Containing the VNET being linked"
  type        = string
}

variable "is_autoregistered" {
  description = "True/False if the DNS Zone should auto-register VM CName entries.  This can be done for only a single VNet per DNS Zone"
  type        = bool
  default     = false
}

variable "virtual_network_id" {}