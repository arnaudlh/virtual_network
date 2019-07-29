// Creates the networks virtual network

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}${var.networking_object["region1"].vnet.name}"
  location            = var.location
  resource_group_name = var.virtual_network_rg
  address_space       = var.networking_object["region1"].vnet.address_space
  dns_servers         = var.networking_object["region1"].vnet.dns
  tags                = var.tags
}

module "firewall_subnet_region1" {
  source                = "./subnet"

  resource_group        = var.virtual_network_rg
  virtual_network_name  = azurerm_virtual_network.vnet.name
  subnets               = map(
                              "AzureFirewallSubnet", var.networking_object["region1"].subnets["AzureFirewallSubnet"]
                            )
  subnets_to_exclude  = [""]
  tags                =var.tags
  location            = var.location
}

module "subnets_region1" {
  source                = "./subnet"

  resource_group        = var.virtual_network_rg
  virtual_network_name  = azurerm_virtual_network.vnet.name
  subnets               = var.networking_object["region1"].subnets
  subnets_to_exclude    = ["AzureFirewallSubnet"]
  tags                  = var.tags
  location              = var.location
}

module "nsg_region1" {
  source                = "./nsg"

  resource_group        = var.virtual_network_rg
  virtual_network_name  = azurerm_virtual_network.vnet.name
  subnets               = var.networking_object["region1"].subnets
  subnets_to_exclude    = ["AzureFirewallSubnet"]
  tags                  =var.tags
  location              = var.location
  log_analytics_workspace = var.log_analytics_workspace
  diagnostics_map       = var.diagnostics_map
  subnet_ids_map        = module.subnets_region1.subnet_ids_map
}

# module "nsg_attach" {
#   source                = "./nsg_attach"

#   nsg_list              = module.nsg_region1.nsgs
#   vnet_list             = module.subnets_region1.v_subnets
# }


