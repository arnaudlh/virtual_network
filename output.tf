//Exports main data for peering and security post-deployment touch
output "vnet" {
  value = {
  "vnet_name"           = azurerm_virtual_network.vnet.name
  "vnet_adress_space"   = azurerm_virtual_network.vnet.address_space
  "vnet_id"             = azurerm_virtual_network.vnet.id
  "vnet_dns"            = azurerm_virtual_network.vnet.dns_servers
  }
}

output "vnet_obj" {
  value = azurerm_virtual_network.vnet
}

output "subnet_ids_region1" {
  value = module.subnets_region1.subnet_ids
}

output "subnet_ids_map_region1" {
  value = module.subnets_region1.subnet_ids_map
}
output "nsg_obj" {
  value = module.nsg_region1.nsg_obj
}
