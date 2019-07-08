variable "virtual_network_name" {
  description = "(Required) Map of the resource groups to create"
    type      = string
}

variable "virtual_network_address" {
  description = "(Required) Map of the resource groups to create"
  type        = list(string)
}

variable "virtual_network_subnet_list" {
  description = "(Required) Map of the resource groups to create"
}

variable "virtual_network_dns" {
  description = "(Required) Map of the resource groups to create"
  type        = list(string)
}

variable "virtual_network_rg" {
  description = "(Required) Map of the resource groups to create"
  type        = string
}

variable "location" {
  description = "(Required) Define the region where the resource groups will be created"
}

variable "prefix" {
  description = "(Optional) You can use a prefix to add to the list of resource groups you want to create"
}

variable "tags" {
  description = "tags for the deployment"
}
