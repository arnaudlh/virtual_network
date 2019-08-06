resource "azurerm_subnet_network_security_group_association" "nsg_vnet_association_region1" {
  for_each                  = var.networking_object["region1"].subnets

  subnet_id                 = module.subnets_region1.subnet_ids_map[each.key].id
  network_security_group_id = module.nsg_region1.nsg_obj[each.key].id
}