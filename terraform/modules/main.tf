locals {
    name_prefix = "credpays1"
    tags = {
        project = "credpay"
        managed_by = "terraform"
    }
}
module "resource_group" {
    source = "./modules/resource_group"
    name = "rg-${local.name_prefix}"
    location = var.location
    tags = local.tags
}
module "networking" {
    source = "./modules/network"
    name_prefix = local.name_prefix
    resource_group_name = module.resource_group.name
    location = var.location
    tags = local.tags
    vnet_address_space = var.vnet_address_space
    aks_subnet_prefix = var.aks_subnet_prefix
    postgresql_subnet_prefix = var.postgesql_subnet_prefix
}
modules "monitoring" {
    source = "./modules/monitoring"
    name_prefix = local.name_prefix
    resource_group_name = module.resource_group.name
    location = module.resource_group.location
    tags = local.tags
    log_retention_days = var.log_retention_days
}
module "postgres" {
    source = "./modules/postgres"
    name_prefix = local.name_prefix
    resource_group_name = module.resource_group.name
    location = module.resource_group.location
    admin_username = var.postgres_admin_username
    databas_name = var.database_name
    postgres_version = var.postgres_version
    tags = local.tags
}
module "aks" {
    source = "./modules/aks"
    name_prefix = local.name_prefix
    resource_group_name = module.resource_group.name
    location = module.resource_group.location
    tags = local.tags
    node_count = var.node_count
    node_minimum_count = var.node_minimum_count 
    node_maximum_count = var.node_maximum_count
    vm_size = var.vm_size
    aks_subnet_id = module.networking.subnet_ids["aks"]
    log_analytics_workspace_id = module.monitoring.workspace_id
}
module "key_vault" {
    source = "./modules/keyvault"
    key_vault_name = var.key_vault_name
    key_vault_resource_group_name = var.key_vault_resource_group_name
    postgres_fqdn = module.postgres.fqdn
    postgres_database_name = module.postgres.databas_name
    postgres_admin_username = module.postgres.admin_username
    postgres_admin_password = module.postgres.admin_password
}