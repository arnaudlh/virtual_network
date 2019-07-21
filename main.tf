//TODO: 
//Ideally should implement Network Watcher flow logs - but no TF provider available as per: https://github.com/terraform-providers/terraform-provider-azurerm/issues/1776 


// Creates the empty NSG for each subnet in the network
resource "azurerm_network_security_group" "nsg_obj" {
  count = "${length(var.virtual_network_subnet_list)}"

  name                    = "${lookup(var.virtual_network_subnet_list[count.index], "name")}-nsg"
  location                = var.location
  resource_group_name     = var.virtual_network_rg
  tags                    = var.tags
}



// Creates the networks 
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}${var.virtual_network_name}"
  location            = var.location
  resource_group_name = var.virtual_network_rg
  address_space       = var.virtual_network_address
  dns_servers         = var.virtual_network_dns

  dynamic "subnet" {
    for_each = [for s in var.virtual_network_subnet_list: {
        name           = s.name
        address_prefix = s.prefix
 //       security_group = var.name != "AzureFirewallSubnet" ? [element(azurerm_network_security_group.nsg_obj[*].id, subnet.key)] : []  
    }
    ]
  
  content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
      security_group = subnet.value.name != "AzureFirewallSubnet" ? "${element(azurerm_network_security_group.nsg_obj[*].id, subnet.key)}" : ""  
      }

          }
      
  tags = var.tags
  }
