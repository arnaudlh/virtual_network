
// Creates the vnet's virtual subnetworks

resource "azurerm_subnet" "v_subnet" {
  count                   = length(local.subnet_list) 

    lifecycle {
        ignore_changes = [network_security_group_id]
    }

  name                    = var.subnets[element(local.subnet_list, count.index)].name
  resource_group_name     = var.resource_group
  virtual_network_name    = var.virtual_network_name
  address_prefix          = var.subnets[element(local.subnet_list, count.index)].cidr
  service_endpoints       = var.subnets[element(local.subnet_list, count.index)].service_endpoints
}

