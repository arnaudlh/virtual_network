
variable "virtual_network_rg" {
  description = "(Required) Map of the resource groups to create"
  type        = string
}

variable "location" {
  description = "(Required) Define the region where the resource groups will be created"
  type        = string
}

variable "prefix" {
  description = "(Optional) You can use a prefix to add to the list of resource groups you want to create"
  type        = string
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

variable "opslogs_retention_period" {
  description = "Number of days to keep operations logs inside storage account"
  default = 60
}

variable "networking_object" {
  description = "object describing the networking configuration, as described below"
}

#Sample of network configuration object below
# networking_object = {
#   region1 = {
#       vnet = {
#           name                = "sg1-vnet-dmz"
#           address_space       = ["10.101.4.0/22"]     # 10.100.4.0 - 10.100.7.255
#           dns                 = ["192.168.0.16", "192.168.0.64"]
#           ddos_standard       = true                  # for future use
#       }
#       specialsubnets     = {
#               AzureFirewallSubnet = {
#               name                = "AzureFirewallSubnet"
#               cidr                = "10.101.4.0/25"
#               service_endpoints   = []
#               nsg_inbound         = []
#               nsg_outbound        = []
#               }
#           }
#       subnets = {
#           Subnet_1        = {
#               name                = "Active_Directory"
#               cidr                = "10.101.4.128/27"
#               service_endpoints   = []
#               nsg_inbound         = []
#               nsg_outbound        = []
#           }
#           Subnet_2             = {
#               name                = "SQL_Servers"
#               cidr                = "10.101.4.160/27"
#               service_endpoints   = []
#               nsg_inbound         = []
#               nsg_outbound        = []
#           }
#           Subnet_3       = {
#               name                = "Network_Monitoring"
#               cidr                = "10.101.4.192/27"
#               service_endpoints   = ["Microsoft.EventHub"]
#               nsg_inbound         = []
#               nsg_outbound        = []
#           }
#            Subnet_4       = {
#                name                = "Intranet"
#                cidr                = "10.101.5.0/24"
#                service_endpoints   = ["Microsoft.EventHub"]
#                nsg_inbound         = []
#                nsg_outbound        = []
#            }
#            Subnet_5       = {
#                name                = "Biztalk"
#                cidr                = "10.101.6.0/24"
#                service_endpoints   = ["Microsoft.EventHub"]
#                nsg_inbound         = []
#                nsg_outbound        = []
#            }
#            Subnet_6       = {
#                name                = "IDS"
#                cidr                = "10.101.7.0/24"
#                service_endpoints   = ["Microsoft.EventHub"]
#                nsg_inbound         = []
#                nsg_outbound        = []
#            }
#       }
#}
#}
