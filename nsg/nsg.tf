
# # Creates the empty NSG for each subnet in the network - NSG is empty by default, this is useful for enablement of NSG Flow logs/traffic analytics configuration.
# # Later version to implement NSG libraty to be bound to vnet depending on roles.

resource "azurerm_network_security_group" "nsg_obj" {
  count                   = length(local.subnet_list) 

  name                    = "${element(local.subnet_list, count.index)}-nsg"
  resource_group_name     = var.resource_group
  location                = var.location
  tags                    = var.tags
}

resource "azurerm_subnet_network_security_group_association" "nsg_vnet_association_region1" {
  count                     = length(local.subnet_list)

  subnet_id                 = var.subnet_ids_map[element(local.subnet_list, count.index)]
  network_security_group_id = azurerm_network_security_group.nsg_obj[count.index].id
}