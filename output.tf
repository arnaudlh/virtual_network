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

output "vnet_subnets" {
  value = zipmap(azurerm_virtual_network.vnet.subnet.*.name, azurerm_virtual_network.vnet.subnet.*.id)
}

//Exports the NSG objects created
output "nsg_vnet" {
  value = zipmap(azurerm_network_security_group.nsg_obj.*.name, azurerm_network_security_group.nsg_obj.*.id)
}

