//Exports main data for peering and security post-deployment touch
output "shared_services_vnet" {
  value = {
  "vnet_name"           = azurerm_virtual_network.vnet.name
  "vnet_adress_space"   = azurerm_virtual_network.vnet.address_space
  "vnet_id"             = azurerm_virtual_network.vnet.id
  "vnet_dns"            = azurerm_virtual_network.vnet.dns_servers
  }
}

//Exports the NSG objects created
output "nsg_vnet" {
value = {
    "nsg_name"    = azurerm_network_security_group.nsg_obj.*.name
    "nsg_id"      = azurerm_network_security_group.nsg_obj.*.id
}
}

