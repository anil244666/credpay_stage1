variable "name_prefix" {
    type = string
}
variable "resource_group_name" {
    type = string
}
variable "location" {
    type = string
}
variable "node_count" {
    type = number
}
variable "node_min_count" {
  type    = number
  default = 1
}

variable "node_max_count" {
  type    = number
  default = 3
}
variable "vm_size" {
    type = string
}
variable "aks_subnet_id" {
    type = string
}
variable "log_analytics_workspace_id" {
    type = string
}
variable "tags" {
    type = map(string)
}
