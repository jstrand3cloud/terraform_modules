variable "resource_group_name" {
  description = "Name of the Resource Group in which to deploy these resources"
  type        = string
}

variable "location" {
  description = "Region in which to deploy these resources"
  type        = string
}

variable "tags" {
  description = "Additional default tags to add to the resources being deployed at this layer."
  type        = map(string)
  default     = null
}

# variable "key_vault_name" {
#   type        = string
#   description = "Name of the shared VM SSH keyvault created with the hub/shared resources"
# }

## Virtual Network variables ##

variable "subnet_id" {
  description = "ID of the Subnet to which the machine will connect to."
  type        = string
}

## Virtual Machine variables ##

variable "vm_name" {
  description = "Name of the virtual machine to create"
  type        = string

}

variable "vm_size" {
  description = "**OPTIONAL**: Size of the vm to deploy"
  default     = "Standard_F2s"
}

variable "vm_image_id" {
  description = "**OPTIONAL**: ID of the custom image to use"
  type        = string
  default     = null
}


variable "vm_publisher" {
  type        = string
  description = "Publisher of the image"
  default     = "Canonical"
}

variable "vm_offer" {
  type        = string
  description = "Offer of the image"
  default     = "UbuntuServer"
}

variable "vm_sku" {
  type        = string
  description = "Sku for the image."
  default     = "20.04-LTS"
}

variable "vm_version" {
  type        = string
  description = "Verison of the image"
  default     = "latest"
}

variable "vm_osdisktype" {
  type        = string
  description = "Type of OS disk"
  default     = "Standard_LRS"
}

variable "vm_timezone" {
  description = "The Timezone of the session hosts"
  type        = string
  default     = "Eastern Standard Time"

  validation {
    condition = contains([
      "Afghanistan Standard Time",
      "Alaskan Standard Time",
      "Aleutian Standard Time",
      "Altai Standard Time",
      "Arab Standard Time",
      "Arabian Standard Time",
      "Arabic Standard Time",
      "Argentina Standard Time",
      "Astrakhan Standard Time",
      "Atlantic Standard Time",
      "AUS Central Standard Time",
      "Aus Central W. Standard Time",
      "AUS Eastern Standard Time",
      "Azerbaijan Standard Time",
      "Azores Standard Time",
      "Bahia Standard Time",
      "Bangladesh Standard Time",
      "Belarus Standard Time",
      "Bougainville Standard Time",
      "Canada Central Standard Time",
      "Cape Verde Standard Time",
      "Caucasus Standard Time",
      "Cen. Australia Standard Time",
      "Central America Standard Time",
      "Central Asia Standard Time",
      "Central Brazilian Standard Time",
      "Central Europe Standard Time",
      "Central European Standard Time",
      "Central Pacific Standard Time",
      "Central Standard Time (Mexico)",
      "Central Standard Time",
      "Chatham Islands Standard Time",
      "China Standard Time",
      "Cuba Standard Time",
      "Dateline Standard Time",
      "E. Africa Standard Time",
      "E. Australia Standard Time",
      "E. Europe Standard Time",
      "E. South America Standard Time",
      "Easter Island Standard Time",
      "Eastern Standard Time (Mexico)",
      "Eastern Standard Time",
      "Egypt Standard Time",
      "Ekaterinburg Standard Time",
      "Fiji Standard Time",
      "FLE Standard Time",
      "Georgian Standard Time",
      "GMT Standard Time",
      "Greenland Standard Time",
      "Greenwich Standard Time",
      "GTB Standard Time",
      "Haiti Standard Time",
      "Hawaiian Standard Time",
      "India Standard Time",
      "Iran Standard Time",
      "Israel Standard Time",
      "Jordan Standard Time",
      "Kaliningrad Standard Time",
      "Kamchatka Standard Time",
      "Korea Standard Time",
      "Libya Standard Time",
      "Line Islands Standard Time",
      "Lord Howe Standard Time",
      "Magadan Standard Time",
      "Magallanes Standard Time",
      "Marquesas Standard Time",
      "Mauritius Standard Time",
      "Mid-Atlantic Standard Time",
      "Middle East Standard Time",
      "Montevideo Standard Time",
      "Morocco Standard Time",
      "Mountain Standard Time (Mexico)",
      "Mountain Standard Time",
      "Myanmar Standard Time",
      "N. Central Asia Standard Time",
      "Namibia Standard Time",
      "Nepal Standard Time",
      "New Zealand Standard Time",
      "Newfoundland Standard Time",
      "Norfolk Standard Time",
      "North Asia East Standard Time",
      "North Asia Standard Time",
      "North Korea Standard Time",
      "Omsk Standard Time",
      "Pacific SA Standard Time",
      "Pacific Standard Time (Mexico)",
      "Pacific Standard Time",
      "Pakistan Standard Time",
      "Paraguay Standard Time",
      "Qyzylorda Standard Time",
      "Romance Standard Time",
      "Russia Time Zone 10",
      "Russia Time Zone 11",
      "Russia Time Zone 3",
      "Russian Standard Time",
      "SA Eastern Standard Time",
      "SA Pacific Standard Time",
      "SA Western Standard Time",
      "Saint Pierre Standard Time",
      "Sakhalin Standard Time",
      "Samoa Standard Time",
      "Sao Tome Standard Time",
      "Saratov Standard Time",
      "SE Asia Standard Time",
      "Singapore Standard Time",
      "South Africa Standard Time",
      "South Sudan Standard Time",
      "Sri Lanka Standard Time",
      "Sudan Standard Time",
      "Syria Standard Time",
      "Taipei Standard Time",
      "Tasmania Standard Time",
      "Tocantins Standard Time",
      "Tokyo Standard Time",
      "Tomsk Standard Time",
      "Tonga Standard Time",
      "Transbaikal Standard Time",
      "Turkey Standard Time",
      "Turks And Caicos Standard Time",
      "Ulaanbaatar Standard Time",
      "US Eastern Standard Time",
      "US Mountain Standard Time",
      "UTC",
      "UTC+12",
      "UTC+13",
      "UTC-02",
      "UTC-08",
      "UTC-09",
      "UTC-11",
      "Venezuela Standard Time",
      "Vladivostok Standard Time",
      "Volgograd Standard Time",
      "W. Australia Standard Time",
      "W. Central Africa Standard Time",
      "W. Europe Standard Time",
      "W. Mongolia Standard Time",
      "West Asia Standard Time",
      "West Bank Standard Time",
      "West Pacific Standard Time",
      "Yakutsk Standard Time",
      "Yukon Standard Time"
    ], var.vm_timezone)
    error_message = "Please use a Timezone ID supported by Windows. (PS> [System.TimeZoneInfo]::GetSystemTimeZones().id)."
  }
}

variable "vm_osdisk_size" {
  description = ""
  type        = number
  default     = 128
}

variable "local_admin_username" {
  description = "**OPTIONAL**: Name of the local admin account"
  type        = string
  default     = "azureadmin"

  #validation {
  #  condition = can(regex("{1,20}", var.local_admin_username))
  #  error_message = "Please use a supported azure vm username."
  #}
}

variable "platform_update_domain_count" {
  description = "Number of Update domains that these VMs will be deployed to"
  type        = number
  default     = 2
}

variable "platform_fault_domain_count" {
  description = "Number of Fault domains that these VMs will be deployed to"
  type        = number
  default     = 3
}

variable "naming_standards" {
  description = "Configuration for the naming of all resources created by the code base. This configuration is passed up to each layer that follows. It can be overridden at each layer. Names are created via the 3Cloud Naminer Standards module"
  type = object({
    tenant                = string #(Optional) Name of the tenant being deployed to. Optional parameter used when clients have multiple tenants and wish it to be part of the naming standard
    format_string         = string #(Reauired) The order of the naming values. This allows the configurator to change the naming standard to match the customers needs. By default the order is (environment, location, application, name, resource_type)
    format_string_storage = string #(Required) The order for resources with shorter name requirements. Any of the naming values can be used. The naming standard will trim the string to fit example "environment, location, name"
    separator             = string #(Required) The character to place between naming values it may be a null string"-"
    application           = string #(Required) The name of the application being deployed default for this level is "launchpad"
    application_short     = string #(Required) A short version of the application name being deployed default for this level is "lpad"
    environment           = string #(Required) The name of the environment being deployed default for this level is "shared"
    environment_short     = string #(Required) A short version of the application name being deployed default for this level is "shrd"
  })
  default = {
    tenant                = ""
    format_string         = "environment, location, application, name, resource_type"
    format_string_storage = "environment, location, name"
    separator             = "-"
    application           = "launchpad"
    application_short     = "lpad"
    environment           = "shared"
    environment_short     = "shrd"
  }
}

variable "license_type" {
  type        = string
  description = "Possible values RHEL_BYOS / SLES_BYOS"
  default     = null
  # validation {
  #   condition = contains(["RHEL_BYOS"
  #     , "SLES_BYOS"
  #     , null]
  #   , var.license_type)
  #   error_message = "Valid values are RHEL_BYOS, SLES_BYOS, or null."
  # }
}

# variable "recovery_backup_policy_id" {
#   type        = string
#   description = "Id of backup policy to be applied to the Linux VM"
# }

# variable "recovery_services_vault_rg" {
#   type        = string
#   description = "Recovery service vault resource group name"
# }

# variable "recovery_services_vault_name" {
#   type        = string
#   description = "Recovery service vault name"
# }

variable "ultra_ssd_enabled" {
  type        = string
  description = "Should the capacity to enable Data Disks of the UltraSSD_LRS storage account type be supported on this Virtual Machine"
  default     = "false"
}

variable "passwordLength" {
  type        = number
  description = "Lenght of the password to be auto created"
  default     = 12
}

# variable "avset_name" {
#   type        = string
#   description = "Availability set name for naming module"
# }

# variable "nic_name" {
#   type        = string
#   description = "nic name for naming module"
# }

variable "osdiskcaching" {
  type    = string
  default = "ReadWrite"
}

# variable "resource_group" {}
variable "key_vault_id" {}
variable "private_ip_address_allocation" {}