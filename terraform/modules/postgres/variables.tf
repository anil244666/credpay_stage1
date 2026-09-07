variable "name_prefix" {
  type        = string
  description = "Prefix for resource names"
}
variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}
variable "location" {
  type        = string
  description = "Azure region for resources"
}
variable "admin_username" {
  type        = string
  description = "Admin username for PostgreSQL"
}
variable "database_name" {
  type        = string
  description = "Name of the PostgreSQL database"
}
variable "postgres_version" {
  type        = string
  description = "PostgreSQL version"
}
variable "tags" {
  type        = map(string)
  default    = {
    environment = "dev"
  }
  description = "Tags for resources"
}