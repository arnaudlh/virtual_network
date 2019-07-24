
# Creates the empty NSG for each subnet in the network - NSG is empty by default, this is useful for enablement of NSG Flow logs/traffic analytics configuration.
# Later version to implement NSG libraty to be bound to vnet depending on roles.

locals {
  vnet1 = keys(var.networking_object["region1"].subnets)
}
resource "azurerm_network_security_group" "nsg_obj" {
  count                   = length(local.vnet1) 

  name                    = "${var.prefix}${var.networking_object["region1"].subnets[element(local.vnet1, count.index)].name}-nsg"
  resource_group_name     = var.virtual_network_rg
  location                = var.location
  tags                    = var.tags
}

# resource "azurerm_subnet_network_security_group_association" "nsg_vnet_association" {
#   count                     = length(local.vnet1)

#   subnet_id                 = azurerm_subnet.v_subnet[count.index].id
#   network_security_group_id = azurerm_network_security_group.nsg_obj[count.index].id
# }

#Need to catch if subnet is called AzureFirewallSubnet, then dont create the NSG or dont bind it (fails at binding time)
#security_group = azurerm_subnet.v_subnet[count.index].name != "AzureFirewallSubnet" ? "${element(azurerm_network_security_group.nsg_obj[*].id, subnet.key)}" : ""  