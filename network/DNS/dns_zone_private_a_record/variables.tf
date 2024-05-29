## Shared Properties ##

variable "tags" {
  type        = map(string)
  description = "Additional default tags to add to the resources being deployed at this layer. Application, Environment and Level are added by default"
  default     = {}
}

## Module Properties ##

variable "a_record_name" {
  description = "This is the name of the Private DNS Zone A Record"
  type        = string
}

variable "dns_zone_name" {
  description = "This is the name of the Private DNS Zone that will contain the A Record"
  type        = string
}

variable "dns_zone_rg_name" {
  description = "The name of the resource group to use for the Private DNS Zone that will contain the A Record"
  type        = string
}

variable "a_record_ttl" {
  description = "The Time To Live (TTL) of the A Record, in seconds"
  type        = number
  default     = 300
}

variable "a_record_ip_address" {
  description = "The list of IP addresses to associate to the A Record.  We will generally only associate a single IP address to an A Record"
  type        = list(string)
}