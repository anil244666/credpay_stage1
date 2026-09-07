subscription_id = "82377c62-bcaf-4fae-a8bb-ca7d0edb51d2"
location = "eastus"
vnet_address_space = "10.0.0.0/16"
aks_subnet_prefix = "10.0.1.0/24"
postgesql_subnet_prefix = "10.0.2.0/24"
node_count = 2
node_minimum_count = 2
node_maximum_count = 2
vm_size = "Standard_DS2alds_v6"
postgres_version = "17"
postgres_admin_username = "credpayadmin"
database_name = "credpay"
log_retention_days = 7
key_vault_name = "credpaykeyvault1"
key_resource_group_name = "credpay-RG"
 