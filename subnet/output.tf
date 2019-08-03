output "subnet_ids" {
  value = azurerm_subnet.v_subnet[*].id
}

output "subnet_ids_map" {
  value = zipmap(
      azurerm_subnet.v_subnet[*].name, azurerm_subnet.v_subnet[*].id
  )
}
