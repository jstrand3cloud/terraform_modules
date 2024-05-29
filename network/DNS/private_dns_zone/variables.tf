variable "tags" {
  type        = map(string)
  description = "Additional default tags to add to the resources being deployed at this layer. Application, Environment and Level are added by default"
  default     = {}
}

## Module Properties ##

variable "private_dns_zone_name" {
  description = "This is the object name of the Private DNS Zone"
  type        = string
}

variable "zone_resource_group_name" {
  description = "The name of the resource group to use for the Private DNS Zone"
  type        = string
}