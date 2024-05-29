## Shared Properties ##

variable "location" {
  description = "Region in which to deploy these resources"
  type        = string
  default     = "eastus"
}

## Module Properties ##
variable "vnet_name" {
  description = "The Virtual Network that should have the subnets created into them"
}

variable "resource_group" {
  description = "The Virtual Network Resource Group Name that should have the subnets created into them"
}

variable "subnet_name" {
  description = "Name of subnet"
  type        = string
}

variable "subnet_range" {
  description = "CIDR range of subnet"
  type        = list(string)
}
variable "service_endpoints" {
  description = "list of service endpoints"
  type        = list(string)

}
variable "delegation_name" {
  description = "Name of delegation"
  type        = string

}
variable "delegation_actions" {
  description = "List of delegation actions"
  type        = list(string)
}

variable "enforce_private_link_endpoint_network_policies" {
  description = "Bool for if network policies are enforced"
  type        = bool
}


variable "tags" {
  description = "(Required) Tags to be applied"
  type        = map(string)
}