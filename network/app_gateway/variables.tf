variable "name" {
  type        = string
  description = "The name of the Application Gateway"
}

variable "location" {
  type        = string
  description = "The location/region where the Application Gateway is created"
}

variable "rg_name" {
  type        = string
  description = "The name of the resource group in which the Application Gateway is created"
}

variable "tags" {
  type        = map(string)
  description = "The tags to associate with your network security group."
}

variable "sku_name" {
  type        = string
  description = "The name of the SKU"
}

variable "sku_tier" {
  type        = string
  description = "The tier of the SKU"
}

variable "availability_zones" {
  type        = list(number)
  description = "A list of availability zones denoting where the Application Gateway needs to be created"
  default     = ["1", "2", "3"]
}

# variable "user_assigned_identity_id" {
#     type = string
#     description = "The ID of the user assigned identity"
# }

variable "private_ip_address" {
  type        = string
  description = "The private IP address of the Application Gateway"
}

# variable "public_ip_address_id" {
#     type = string
#     description = "The ID of the public IP address"
# }

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet"
}

# variable "autoscale_configuration"{
#     type = object({
#         min_capacity = number
#         max_capacity = number
#     })
#     description = "Autoscale configuration"
#     default = {
#         min_capacity = 0
#         max_capacity = 3
#     }
# }

variable "backend_address_pools" {
  type        = any
  description = "Backend address pool"
  default     = {}
}

variable "probes" {
  type        = any
  description = "Probes"
  default     = {}
}

variable "backend_http_settings" {
  type        = any
  description = "Backend HTTP settings"
  default     = {}
}

variable "http_listeners" {
  type        = any
  description = "HTTP listeners"
  default     = {}
}

variable "basic_request_routing_rules" {
  type        = any
  description = "Basic request routing rules"
  default     = {}
}

# variable "redirect_request_routing_rules" {
#     type = map(object({
#         name = string
#         http_listener_name = string
#         redirect_configuration_name = string
#         priority = number
#     }))
#     description = "Redirect request routing rules"
#     default = {}
# }

variable ssl_certificates {
    type = any
    description = "SSL certificates"
    default = {}
}

# variable "trusted_root_certificates" {
#     type = any
#     description = "Trusted root certificates"
#     default = {}
# }

# variable "redirect_configurations" {
#     type = any
#     description = "Redirect configurations"
#     default = {}
# }

# variable "waf_configuration" {
#     type = object({
#         enabled = bool
#         firewall_mode = string
#         rule_set_type = string
#         rule_set_version = string
#     })
#     description = "WAF configuration"
#     default = {
#         enabled = true
#         firewall_mode = "Detection"
#         rule_set_type = "OWASP"
#         rule_set_version = "3.2"
#     }
# }