output "subnet_ids" {
  value = azurerm_subnet.v_subnet[*].id
}

output "subnet_ids_map" {
  value = zipmap(
      local.subnet_list, azurerm_subnet.v_subnet[*].id
  )
}
