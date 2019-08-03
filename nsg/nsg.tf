
# # Creates the empty NSG for each subnet in the network - NSG is empty by default, this is useful for enablement of NSG Flow logs/traffic analytics configuration.
# # Later version to implement NSG libraty to be bound to vnet depending on roles.

locals {
    subnet_list = keys(var.subnets)
}


resource "azurerm_network_security_group" "nsg_obj" {
  count                   = length(local.subnet_list) 


  name                    = "${element(local.subnet_list, count.index)}"
  resource_group_name     = var.resource_group
  location                = var.location
  tags                    = var.tags
}

# resource "azurerm_subnet_network_security_group_association" "nsg_vnet_association_region1" {
#   count                     = length(local.subnet_list2)



#   subnet_id                 = lookup(var.subnets, element(local.subnet_list2, count.index))
#   network_security_group_id = azurerm_network_security_group.nsg_obj[count.index].id
# }

resource "azurerm_subnet_network_security_group_association" "nsg_vnet_association_region1" {
  for_each                  = var.subnets

  subnet_id                 = each.value
  network_security_group_id = element(tolist(azurerm_network_security_group.nsg_obj[*]), index(azurerm_network_security_group.nsg_obj[*].name, each.key)).id
}