resource "azurerm_virtual_network" "vnet" {
    name                = "vnet-${var.name_prefix}"
    address_space       = [var.vnet_address_space]
    location            = var.location
    resource_group_name = var.resource_group_name
    tags                = var.tags
}
resource "azurerm_subnet" "aks_subnet" {
    name                 = aks-subnet
    resource_group_name  = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes     = [var.aks_subnet_prefix]
}
resource "azurerm_subnet" "postgresql_subnet" {
    name                 = postgresql-subnet
    resource_group_name  = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes     = [var.postgresql_subnet_prefix]
} 