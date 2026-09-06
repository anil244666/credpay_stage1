outpuT "server_name" {
    description = "The name of the PostgreSQL server"
  value = azurerm_postgresql_server.postgres.name
}
output "server_id"{
    description = "The ID of the PostgreSQL server"
  value = azurerm_postgresql_server.postgres.id
}
output "fqdn"{
    description = "The fully qualified domain name of the PostgreSQL server"
  value = azurerm_postgresql_server.postgres.fqdn
}
output "database_name"{
    description = "The name of the PostgreSQL database"
  value = azurerm_postgresql_flexible_server_database.pgdb.name
}
ouput "admin_username"{
    description = "The administrator username for the PostgreSQL server"
  value = azurerm_postgresql_flexible_server.postgres_server.administrator_login
}
output "admin_password"{
    description = "The administrator password for the PostgreSQL server"
    value = random_password.admin.result
    sensitive = true
}
