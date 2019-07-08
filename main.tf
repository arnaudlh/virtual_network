

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
    }
    ]
  
  content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
    }
  }
  tags = var.tags
  }