output "resource_group_name" {
  value = azurerm_resource_group.school.name
}

output "virtual_network" {
  value = azurerm_virtual_network.school_vnet.name
}

output "external_subnet" {
  value = azurerm_subnet.external.name
}

output "internal_subnet" {
  value = azurerm_subnet.internal.name
}
