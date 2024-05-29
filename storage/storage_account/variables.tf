## Shared Properties ##

variable "location" {
  description = "Region in which to deploy these resources"
  type        = string
  default     = "eastus"
}

variable "tags" {
  type        = map(string)
  description = "Additional default tags to add to the resources being deployed at this layer. Application, Environment and Level are added by default"
  default     = {}
}

## Module Properties ##

variable "storage_account_resource_group_name" {
  description = "The Storage Account Resource Group Name that will host a Storage Account V2 Private hosting blobs"
}

variable "storage_account_name" {
  type        = string
  description = "The object name of the Storage Account V2 Private hosting blobs"
}

variable "storage_account_replication_type" {
  type        = string
  description = "The Storage Account Replication Type"
  validation {
    condition     = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"], var.storage_account_replication_type)
    error_message = "The sku must be one of: LRS, GRS, RAGRS, ZRS, GZRS, or RAGZRS."
  }
}

variable "storage_account_access_tier" {
  type        = string
  description = "The Storage Account Access Tier"
  default     = "Hot"
  validation {
    condition     = contains(["Hot", "Cool"], var.storage_account_access_tier)
    error_message = "The sku must be one of Hot or Cool."
  }
}


variable "storage_account_is_gen2" {
  type        = bool
  description = "Is Hierarchical Namespace or Gen2 SKU in the Storage Account.  Note this generally not have as deep of backup/soft delete options."
  default     = false
}

variable "storage_account_containers" {
  type = map(object({
    container_access = string
  }))
  default     = {}
  description = "Complex Object of Container Properties to create"
}

## Network Rules Properties
variable "storage_account_allowed_public_ips" {
  type        = list(string)
  description = "Allowed Map of Public IP Addresses to this Storage Account"
  default     = []
  validation {
    condition     = can([for ip in var.storage_account_allowed_public_ips : cidrnetmask(ip)])
    error_message = "These must all be valid ipv4 Public IP Addresses."
  }
}

variable "storage_account_network_bypass" {
  type        = list(string)
  description = "Allowed Values for bypassing the Firewall"
  default     = ["AzureServices"]
  validation {
    condition     = contains(var.storage_account_network_bypass, "AzureServices") || contains(var.storage_account_network_bypass, "Logging") || contains(var.storage_account_network_bypass, "Metrics") || contains(var.storage_account_network_bypass, "None")
    error_message = "These must any combination of: AzureServices, Logging, Metrics, or None."
  }
}

## Data Protection Properties
variable "storage_account_blob_retention_days" {
  type        = number
  description = "The number of days to retain blob backups on the Storage Account.  Set to 0 to disable Blob Retention"
  default     = 30
  validation {
    condition     = contains(range(0, 366), var.storage_account_blob_retention_days)
    error_message = "These must be between the range of 0 to turn it off to 365."
  }
}

variable "storage_account_container_retention_days" {
  type        = number
  description = "The number of days to retain container backups on the Storage Account.  Set to 0 to disable Container Retention"
  default     = 30
  validation {
    condition     = contains(range(0, 366), var.storage_account_container_retention_days)
    error_message = "These must be between the range of 0 to turn it off to 365."
  }
}

variable "storage_account_is_versioning_enabled" {
  type        = bool
  description = "Are blobs versioned in the Storage Account?  Defaults to True"
  default     = true
}

variable "sftp_enabled" {
  type        = string
  description = "Boolean, enable SFTP for the storage account"
  default     = false
}