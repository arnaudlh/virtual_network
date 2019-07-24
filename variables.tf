
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

# Sample for networking_object
#   networking_object = {
#     region1 = {
#         vnet = {
#             name                = "sg-vnet-dmz"
#             address_space       = ["10.101.4.0/22"]     # 10.100.4.0 - 10.100.7.255
#             dns                 = ["192.168.0.16", "192.168.0.64"]
#         }
#         subnets = {
#             subnet0                 = {
#                 name                = "AzureFirewallSubnet"
#                 cidr                = "10.101.4.0/25"
#                 service_endpoints   = []
#             }
#             subnet1                 = {
#                 name                = "Active_Directory"
#                 cidr                = "10.101.4.128/27"
#                 service_endpoints   = []
#             }
#             subnet2                 = {
#                 name                = "SQL_Servers"
#                 cidr                = "10.101.4.160/27"
#                 service_endpoints   = []
#             }
#             subnet3                 = {
#                 name                = "Network_Monitoring"
#                 cidr                = "10.101.4.192/27"
#                 service_endpoints   = []
#             }
#         }
# }
# }