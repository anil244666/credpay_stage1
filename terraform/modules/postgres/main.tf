resource "random_password" "admin" {
  length           = 24
  special          = true
  override_special = "!@?"
  min_lower         = 2
  min_upper         = 2
  min_numeric       = 2
  min_special       = 2

}
resource "azurerm_postgresql_flexible_server" "postgres_server" {
  name                = "psql-${var.name_prefix}"
  resource_group_name = var.resource_group_name
  location            = var.location
  version             = var.postgres_version
  public_network_access_enabled = true
  administrator_login = var.admin_username
  administrator_password = random_password.admin.result
  sku_name           = "B_Standard_B2s"
  storage_mb         = 32768
  backup_retention_days = 7
  tags = var.tags
}
resource "azurerm_postgresql_flexible_server_database" "pgdb" {
  name                = var.databas_name
  server_id           = azurerm_postgresql_flexible_server.postgres_server.id
  charset             = "UTF8"
  collation           = "en_US.UTF8"    
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_azure_services" {
  name                = "AllowazureServices"
  server_id           = azurerm_postgresql_flexible_server.postgres_server.id
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
} 
resource "azurerm_postgresql_flexible_server_configuration" "require_ssl" {
  name                = "required_secure_transport"
  server_id           = azurerm_postgresql_flexible_server.postgres_server.id
  value               = "ON"
}