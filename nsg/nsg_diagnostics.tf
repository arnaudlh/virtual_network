//Creates the NSG diag objects
resource "azurerm_monitor_diagnostic_setting" "nsg_diag" {
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