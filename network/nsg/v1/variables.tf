## Shared Properties ##

variable "location" {
  description = "Region in which to deploy these resources"
  type        = string
  default     = "eastus"
}

variable "tags" {
  type        = map(string)
  description = "Additional default tags to add to the resources being deployed at this layer."
  default     = {}
}

## Module Properties ##
variable "name" {
  description = "The name of the NSG to be created"
  type        = string
}

variable "resource_group" {
  description = "The name of the resource group that will hold the new NSG"
  type        = string
}

variable "security_rules" {
  description = "The initial rules to add into the NSG object"
  type = set(object(
    {
      access                                     = string
      description                                = string
      destination_address_prefix                 = string
      destination_application_security_group_ids = set(string)
      destination_port_range                     = string
      direction                                  = string
      name                                       = string
      priority                                   = number
      protocol                                   = string
      source_address_prefix                      = string
      source_application_security_group_ids      = set(string)
      source_port_range                          = string
    }
  ))
  default = null
}

variable "subnet" {
  description = "The Subnet id to attach the NSG"
  type        = string
  default     = null
}