//TODO: 
//Ideally should implement Network Watcher flow logs - but no TF provider available as per: https://github.com/terraform-providers/terraform-provider-azurerm/issues/1776 


// Creates the empty NSG for each subnet in the network
resource "azurerm_network_security_group" "nsg_obj" {
  count = "${length(var.virtual_network_subnet_list)}"

  name                    = "${lookup(var.virtual_network_subnet_list[count.index], "name")}"
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
        security_group = s.nsg_id
        //TODO: NSG STITCHING IS NOT WORKING
        //need to identify vnet to stitch the NSG 
        //security_group = azurerm_network_security_group.nsg_obj.*.name[s.name]
    }
    ]
  
  content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
      security_group = subnet.value.security_group
    }
  }
  tags = var.tags
  }

// Creates the diagnostics settings for the virtual network object
  resource "azurerm_monitor_diagnostic_setting" "vnet_diag" {

   name                             = "${azurerm_virtual_network.vnet.name}-diag"
   target_resource_id               = "${azurerm_virtual_network.vnet.id}"
   eventhub_name                    = "${var.diagnostics_map.eh_name}"
   eventhub_authorization_rule_id   = "${var.diagnostics_map.eh_id}/authorizationrules/RootManageSharedAccessKey"
   log_analytics_workspace_id       = "${var.log_analytics_workspace.id}"
   storage_account_id               = "${var.diagnostics_map.diags_sa}"
   log {
    
            category =  "VMProtectionAlerts"
            retention_policy {
                days   = 90
                enabled = true
            }
            }
   metric {
            category = "AllMetrics"

            retention_policy {
                days    = 90
                enabled = true
                 }
        }
  }  

//chain the NSG diag objects
resource "azurerm_monitor_diagnostic_setting" "nsg-diag" {
count = "${length(azurerm_network_security_group.nsg_obj)}"

name                = "${azurerm_network_security_group.nsg_obj[count.index].name}-diag"
target_resource_id  = "${azurerm_network_security_group.nsg_obj[count.index].id}"
eventhub_name                    = "${var.diagnostics_map.eh_name}"
eventhub_authorization_rule_id   = "${var.diagnostics_map.eh_id}/authorizationrules/RootManageSharedAccessKey"
log_analytics_workspace_id       = "${var.log_analytics_workspace.id}"
storage_account_id               = "${var.diagnostics_map.diags_sa}"
log {
    
    category =  "NetworkSecurityGroupRuleCounter"
    retention_policy {
      days   = "90"
      enabled = true

    }
    }
log {
    
    category =  "NetworkSecurityGroupEvent"
    retention_policy {
      days   = "90"
      enabled = true

    }
    }
}