variable "disk_name" {
  description = "(Required) Specifies the name of the Managed Disk. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "((Required) Specified the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group" {
  description = "(Required) The name of the Resource Group where the Managed Disk should exist."
  type        = string
}

variable "storage_account_type" {
  description = "(Required) The type of storage to use for the managed disk. Possible values are Standard_LRS, StandardSSD_ZRS, Premium_LRS, Premium_ZRS, StandardSSD_LRS or UltraSSD_LRS. Azure Ultra Disk Storage is only available in a region that support availability zones and can only enabled on the following VM series: ESv3, DSv3, FSv3, LSv2, M and Mv2. For more information see the Azure Ultra Disk Storage https://docs.microsoft.com/azure/virtual-machines/windows/disks-enable-ultra-ssd"
  type        = string
}

variable "create_option" {
  description = "(Required) The method to use when creating the managed disk. Changing this forces a new resource to be created. Possible values include: Import - Import a VHD file in to the managed disk (VHD specified with source_uri). Empty - Create an empty managed disk. Copy - Copy an existing managed disk or snapshot (specified with source_resource_id). FromImage - Copy a Platform Image (specified with image_reference_id) Restore - Set by Azure Backup or Site Recovery on a restored disk (specified with source_resource_id)."
  type        = string
}

variable "disk_size_gb" {
  description = "(Optional, Required for a new managed disk) Specifies the size of the managed disk to create in gigabytes. If create_option is Copy or FromImage, then the value must be equal to or greater than the source's size. The size can only be increased."
  type        = number
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}

variable "zone" {}