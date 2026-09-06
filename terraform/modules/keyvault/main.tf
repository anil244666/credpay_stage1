data "azururem_key_vault" "example" {
  name                = "example-keyvault"
  resource_group_name = "example-resource-group"
}
resource "azururem_key_vault_secret" "postgres_host" {
  name         = "postgres-host"
  key_vault_id = data.azururem_key_vault.kv.id
  value        = var.postgres_fqdn
}
resource "azururem_key_vault_secret" "postgres_username" {
  name         = "postgres-username"
  key_vault_id = data.azururem_key_vault.kv.id
  value        = var.postgres_username
}
resource "azururem_key_vault_secret" "postgres_password" {
  name         = "postgres-password"
  key_vault_id = data.azururem_key_vault.kv.id
  value        = var.postgres_password
}
resource "azurerm_key_vault_secret" "postgres_database" {
  name         = "postgres-db-name"
  key_vault_id = data.azururem_key_vault.kv.id
  value        = var.postgres_database_name
}