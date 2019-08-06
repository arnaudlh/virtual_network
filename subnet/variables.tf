
variable "resource_group" {
  description = "(Required) Map of the resource groups to create"
  type        = string
}
variable "virtual_network_name" {
}


variable "subnets" {
  type = map
}

variable "tags" {
  
}

variable "location" {
  
}

