## Shared Properties ##

variable "location" {
  description = "Region in which to deploy these resources"
  type        = string
  default     = "eastus"
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

variable "tags" {
  type        = map(string)
  description = "Additional default tags to add to the resources being deployed at this layer. Application, Environment and Level are added by default"
  default     = {}
}

## Module Properties ##

variable "key_vault_name" {
  description = "This is the object name of the keyvault"
  type        = string
}

variable "key_vault_resource_group_name" {
  description = "The name of the resource group to use for the keyvault"
  type        = string
}

# variable "key_vault_default_access_policy" {
#   description = "The default keyvault access policy.  Other access_policies can be added via additional modules."
#   type = object(
#     {
#       certificate_permissions = list(string)
#       key_permissions         = list(string)
#       secret_permissions      = list(string)
#       storage_permissions     = list(string)
#     }
#   )
#    default = null
# }

## Module Optional Properties ##

variable "soft_delete_retention_days" {
  description = "The number of days to retain this keyvault/secrets if they were deleted"
  type        = number
  default     = 90
}

variable "purge_protection_enabled" {
  description = "Indicate whether a keyvault/secrets can be purged once they were deleted"
  type        = bool
  default     = false
}

variable "key_vault_sku_name" {
  description = "(required)"
  type        = string
  default     = "standard"

  # validation {
  #   condition     = contains(["standard", "premium"], var.key_vault_sku_name)
  #   error_message = "This needs to match a supported Key Vault SKU (standard/premium)."
  # }
}

variable "enabled_for_disk_encryption" {
  description = "Determine whether the keyvault can be used to retrieve secrets to unwrap keys for disk encryption"
  type        = bool
  default     = false
}

variable "enable_rbac_authorization" {
  description = "Determine whether authorization using RBAC can be used for the keyvault"
  type        = bool
  default     = true
}

variable "enabled_for_deployment" {
  description = "Determine whether Virtual Machines can access certificates stored within the keyvault"
  type        = bool
  default     = false
}

variable "enabled_for_template_deployment" {
  description = "Determine whether Azure Resource Manager can access secrets stored within the keyvault"
  type        = bool
  default     = false
}

variable "contact" {
  description = "Optional contact block to set contact info for certificate creation.  Must be created after access policy exists (Add this property in after initial run-through)"
  type = set(object(
    {
      email = string
      name  = string
      phone = string
    }
  ))
  default = []

  validation {
    condition     = length(tolist(var.contact)) <= 1
    error_message = "This variable only supports a single object of contact properties."
  }
}

variable "key_vault_network_acls" {
  description = "The network restriction rules for the keyvault"
  type = set(object(
    {
      bypass                             = string
      default_action                     = string
      allowed_ip_rules                   = set(string)
      allowed_virtual_network_subnet_ids = set(string)
    }
  ))
  default = []

  validation {
    condition     = length(tolist(var.key_vault_network_acls)) <= 1
    error_message = "This variable only supports a single object of network_acls properties."
  }
}


variable "tenant_id" {}
# variable "key_vault_default_access_policy" {}