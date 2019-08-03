
variable "resource_group" {
  description = "(Required) Map of the resource groups to create"
  type        = string
}
variable "virtual_network_name" {
}

# variable "subnets_to_exclude" {
  
# }

# variable "subnet_ids_map" {
#   type = map
# }

variable "subnets" {
  
}

variable "tags" {
  
}

variable "location" {
  
}

variable "diagnostics_map" {
  
}

variable "log_analytics_workspace" {
  
}

variable "link_nsg_to_subnet" {
  default = true
}

variable "opslogs_retention_period" {
  description = "Number of days to keep operations logs inside storage account"
  default = 60
}

