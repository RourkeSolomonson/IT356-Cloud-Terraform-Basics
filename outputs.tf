output "resource_group" {
  value = azurerm_resource_group.school.name
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}
