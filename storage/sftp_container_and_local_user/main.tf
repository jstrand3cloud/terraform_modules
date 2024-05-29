resource "azurerm_storage_container" "this" {
  name                  = var.container_name
  storage_account_name  = var.storage_account_name
  container_access_type = var.container_access_type
}

resource "azurerm_storage_account_local_user" "this" {
  name                 = var.user_name
  storage_account_id   = var.storage_account_id
  ssh_key_enabled      = true
  ssh_password_enabled = true
  home_directory       = var.home_directory
  ssh_authorized_key {
    description = "${var.user_name} SSH Key"
    key         = tls_private_key.key.public_key_openssh
  }
  permission_scope {
    permissions {
      read   = true
      create = true
      list = true
      write = true
      delete = true
    }
    service       = "blob"
    resource_name = azurerm_storage_container.this.name
  }
}

resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "azurerm_key_vault_secret" "myprivateSshKey" {
  name         = join("-", [azurerm_storage_container.this.name, "privkey"])
  value        = tls_private_key.key.private_key_pem
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "mypublicSshKey" {
  name         = join("-", [azurerm_storage_container.this.name, "pubkey"])
  value        = tls_private_key.key.public_key_pem
  key_vault_id = var.key_vault_id
}
