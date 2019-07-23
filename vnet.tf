// Creates the networks virtual network

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}${var.networking_object["region1"].vnet.name}"
  location            = var.networking_object["region1"].vnet.location
  resource_group_name = var.virtual_network_rg
  address_space       = var.networking_object["region1"].vnet.address_space
  dns_servers         = var.networking_object["region1"].vnet.dns
  tags                = var.tags
  }



// Creates the vnet's virtual subnetworks
locals {
  vnet = keys(var.networking_object["region1"].subnets)
}
resource "azurerm_subnet" "v_subnet" {
  count                   = length(local.vnet) 

  name                    = "${var.prefix}${var.networking_object["region1"].subnets[element(local.vnet, count.index)].name}"
  resource_group_name     = var.virtual_network_rg
  virtual_network_name    = azurerm_virtual_network.vnet.name
  address_prefix          = var.networking_object["region1"].subnets[element(local.vnet, count.index)].cidr
  service_endpoints       = var.networking_object["region1"].subnets[element(local.vnet, count.index)].service_endpoints
}

