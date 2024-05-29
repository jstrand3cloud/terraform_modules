## Shared Properties ##

variable "location" {
  description = "Region in which to deploy these resources"
  type        = string
  default     = "eastus"
}

variable "tags" {
  type        = map(string)
  description = "Additional default tags to add to the resources being deployed at this layer. Application, Environment and Level are added by default"
  default     = {}
}

## Module Properties ##

variable "resource_group" {
  description = "The Virtual Network Resource Group Name that should have the subnets created into them"
}

variable "name" {
  description = "Name of the VNET to make"
  type        = string
}

variable "cidr" {
  description = "CIDR ranges for VNET"
  type        = list(string)
}

variable "dns_servers" {
  description = "DNS servers"
  type        = list(string)
}