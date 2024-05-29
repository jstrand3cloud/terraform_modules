variable "location" {
  description = "(Required) Azure region"
  type        = string
}

variable "tags" {
  description = "(Required) Tags to be applied"
  type        = map(string)
}

variable "name" {
  type = string
}

variable "resource_group_name" {
  description = "(Required) Name of azure resource group to create"
  type        = string
}

variable "cidrs" {
  type = list(string)
}