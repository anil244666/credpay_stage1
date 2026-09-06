output "workspace_id" {
    description = "The id of the log analytics workspace"
    value = azurerm_log_analytics_workspace.log.id
}
output "workspace_name" {
    description = "The name of the log analytics workspace"
    value = azurerm_log_analytics_workspace.log.name
}