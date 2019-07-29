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

# output "vnet_subnets" {
#   value = zipmap(azurerm_subnet.v_subnets.*.name, azurerm_subnet.v_subnets.*.id)
# }

# output "nsg_vnet" {
#   value = zipmap(azurerm_network_security_group.nsg_obj.*.name, azurerm_network_security_group.nsg_obj.*.id)
# }


output "subnet_ids_region1" {
  value = module.subnets_region1.subnet_ids
}
