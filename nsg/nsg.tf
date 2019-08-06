resource "azurerm_network_security_group" "nsg_obj" {

  for_each              = var.subnets


  name                    = each.value.name
  resource_group_name     = var.resource_group
  location                = var.location
  tags                    = var.tags
}
