# resource "azurerm_subnet_network_security_group_association" "nsg_vnet_association_region1" {
#   depends_on                = [module.subnets_region1.subnet_ids_map, module.nsg_region1.nsg_obj]
#   for_each                  = module.subnets_region1.subnet_ids_map

#   subnet_id                 = each.value
#   network_security_group_id = element(tolist(module.nsg_region1.nsg_obj[*]), index(module.nsg_region1.nsg_obj[*].name, each.key)).id
# }