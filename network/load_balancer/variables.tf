variable "location" {
  description = "(Required) Region in which to deploy these resources"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "(Required) Additional default tags to add to the resources being deployed at this layer."
  default     = {}
}

## Module Properties ##
variable "name" {
  description = "(Required) The name of the load balancer to be created"
  type        = string
}

variable "resource_group" {
  description = "(Required) The name of the resource group that will hold the new ALB"
  type        = string
}

variable "frontend_ip_address" {
  type        = string
  description = "Frontend ip address derived from subnet"
}

variable "subnet_id" {
  type        = string
  description = "subnet id"
}