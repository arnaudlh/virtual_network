// Creates the networks virtual network, the subnets and associated NSG, with a special section for AzureFirewallSubnet

resource "azurerm_virtual_network" "vnet" {
  name                  = "${var.prefix}${var.networking_object["region1"].vnet.name}"
  location              = var.location
  resource_group_name   = var.virtual_network_rg
  address_space         = var.networking_object["region1"].vnet.address_space
  dns_servers           = var.networking_object["region1"].vnet.dns
  tags                  = var.tags
}

module "special_subnets_region1" {
  source                = "./subnet"

  resource_group        = var.virtual_network_rg
  virtual_network_name  = azurerm_virtual_network.vnet.name
  subnets               = var.networking_object["region1"].specialsubnets
  tags                  = var.tags
  location              = var.location
}

module "subnets_region1" {
  source                = "./subnet"

  resource_group        = var.virtual_network_rg
  virtual_network_name  = azurerm_virtual_network.vnet.name
  subnets               = var.networking_object["region1"].subnets
  tags                  = var.tags
  location              = var.location
}

module "nsg_region1" {
  source                    = "./nsg"

  resource_group            = var.virtual_network_rg
  virtual_network_name      = azurerm_virtual_network.vnet.name
  subnets                   = var.networking_object["region1"].subnets
  tags                      = var.tags
  location                  = var.location
  log_analytics_workspace   = var.log_analytics_workspace
  diagnostics_map           = var.diagnostics_map
}

