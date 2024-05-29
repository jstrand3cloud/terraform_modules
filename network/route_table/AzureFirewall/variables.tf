variable "location" {
  description = "Region in which to deploy these resources"
  type        = string
  default     = "eastus"
}

variable "tags" {
  type        = map(string)
  description = "These are the Azure Tags that will be associated to resources that support them."
  default     = {}
}

variable "resource_group" {
  description = "Resource group"
  type        = string
}

variable "name" {
  description = "Resource Name"
  type        = string
}

variable "disable_bgp_route_propagation" {
  description = "Should this route table not send routes learned via Network Gateway/BGP?"
  type        = bool
}

variable "nva_routes" {
  description = "Object that contains the routes desired to go through an NVA"
  type = list(object({
    name           = string
    address_prefix = string
    next_hop_ip    = string
  }))
}

variable "vnetlocal_routes" {
  description = "Object that contains the routes desired to leverage default azure routing"
  type = list(object({
    name           = string
    address_prefix = string
  }))
}

# variable "subnet" {
#   description = "Subnet ID to attach route table"
#   type        = string
# }

variable "internet_routes" {}