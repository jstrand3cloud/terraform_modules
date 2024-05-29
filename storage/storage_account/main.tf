locals {
  #Determine if Various Data Blob/Container Functions are enabled
  is_blob_backup_enabled      = var.storage_account_blob_retention_days == 0 ? null : toset([""])      #Set Single Item Array to Trigger Dynamic Block
  is_container_backup_enabled = var.storage_account_container_retention_days == 0 ? null : toset([""]) #Set Single Item Array to Trigger Dynamic Block
}

resource "azurerm_storage_account" "storage_account" {

  name                     = var.storage_account_name
  location                 = var.location
  resource_group_name      = var.storage_account_resource_group_name
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = var.storage_account_replication_type
  min_tls_version          = "TLS1_2"
  is_hns_enabled           = var.storage_account_is_gen2
  sftp_enabled             = var.sftp_enabled

  blob_properties {

    dynamic "delete_retention_policy" {
      for_each = local.is_blob_backup_enabled == true ? [1] : []
      content {
        days = var.storage_account_blob_retention_days
      }
    }

    dynamic "container_delete_retention_policy" {
      for_each = local.is_container_backup_enabled == true ? [1] : []
      content {
        days = var.storage_account_container_retention_days
      }
    }

    versioning_enabled = var.storage_account_is_versioning_enabled
  }

  tags = var.tags
}

