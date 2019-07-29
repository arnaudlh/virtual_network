
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

variable "diagnostics_map" {
  description = "contains the data for diagnostics"
}

variable "log_analytics_workspace" {
  description = "contains the log analaytics workspace for diagnostics"
}

variable "networking_object" {
  description = "object describing the networking configuration"
}