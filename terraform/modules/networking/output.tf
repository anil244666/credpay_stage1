output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.vnet.name
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value = {
    aks        = azurerm_subnet.aks_subnet.id
    postgresql = azurerm_subnet.postgresql_subnet.id
  }
}