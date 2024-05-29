variable "resource_group" {
  type        = string
  description = "The name of the resource group in which to create the Virtual Network Gateway. Changing this forces a new resource to be created"
}
variable "allocation_method" {
  type        = string
  description = "This can be set to Static or Dynamic"
  default     = "Dynamic"
}
variable "location" {
  type        = string
  description = "The location/region where the Virtual Network Gateway is located. Changing this forces a new resource to be created."
}
variable "vnet_gateway_name" {
  type        = string
  description = "The name of the Virtual Network Gateway. Changing this forces a new resource to be created"
}
variable "type" {
  type        = string
  description = "The type of the Virtual Network Gateway. Valid options are Vpn or ExpressRoute. Changing the type forces a new resource to be created"
  default     = "Vpn"
}
variable "vpn_type" {
  type        = string
  description = "The routing type of the Virtual Network Gateway. Valid options are RouteBased or PolicyBased."
  default     = null
}
variable "active_active" {
  type        = bool
  description = "If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance SKU."
  default     = false
}
variable "enable_bgp" {
  type        = bool
  description = "If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway"
  default     = false
}
variable "sku" {
  type        = string
  description = "Configuration of the size and capacity of the virtual network gateway. Valid options are Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4,VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ,VpnGw4AZ and VpnGw5AZ and depend on the type, vpn_type and generation arguments. A PolicyBased gateway only supports the Basic SKU. Further, the UltraPerformance SKU is only supported by an ExpressRoute gateway"
  default     = "basic"
}

variable "gateway_subnet_id" {
  type        = string
  description = ""
}
variable "vpn_client_configuration_address_space" {
  type        = string
  description = "The address space out of which IP addresses for vpn clients will be taken. You can provide more than one address space, e.g. in CIDR notation"
  default     = ""
}
variable "ip_configuration_private_ip_allocation" {
  type        = string
  description = "Defines how the private IP address of the gateways virtual interface is assigned. Valid options are Static or Dynamic."
  default     = "Dynamic"
}

variable "default_local_network_gateway_id" {
  type        = string
  description = "Local Network Gateway ID"
  default     = null
}

variable "gateway_type" {
  type        = string
  description = "Accepts VPN or ExpressRoute"
}

variable "generation" {
  type        = string
  description = "The Generation of the Virtual Network gateway. Possible values include Generation1, Generation2 or None. Changing this forces a new resource to be created."
  default     = "Generation2"
}