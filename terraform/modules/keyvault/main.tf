data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  rbac_authorization_enabled  = true
  tags                        = var.tags
}

resource "azurerm_key_vault_secret" "postgres_host" {
  name         = "postgres-host"
  key_vault_id = azurerm_key_vault.kv.id
  value        = var.postgres_fqdn
}

resource "azurerm_key_vault_secret" "postgres_username" {
  name         = "postgres-username"
  key_vault_id = azurerm_key_vault.kv.id
  value        = var.postgres_username
}

resource "azurerm_key_vault_secret" "postgres_password" {
  name         = "postgres-password"
  key_vault_id = azurerm_key_vault.kv.id
  value        = var.postgres_password
}

resource "azurerm_key_vault_secret" "postgres_database" {
  name         = "postgres-database"
  key_vault_id = azurerm_key_vault.kv.id
  value        = var.postgres_database_name
}