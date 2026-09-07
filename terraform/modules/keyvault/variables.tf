variable "key_vault_resource_group_name" {
  type        = string
}
variable "postgres_fqdn" {
  type        = string
}
variable "postgres_username" {
  type        = string
}
variable "postgres_password" {
  type        = string
}
variable "postgres_database_name" {
  type        = string
}
variable "resource_group_name" {
  type = string
}

variable "key_vault_name" {
  type = string
}
variable "location" {
  type        = string
  description = "The Azure region where resources are deployed"
}
variable "tags" {
  type    = map(string)
  default = {}
}