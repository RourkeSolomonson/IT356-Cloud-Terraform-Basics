resource "azurerm_network_security_group" "external_nsg" {
  name                = "external-nsg"
  location            = azurerm_resource_group.school.location
  resource_group_name = azurerm_resource_group.school.name
}

resource "azurerm_network_security_group" "internal_nsg" {
  name                = "internal-nsg"
  location            = azurerm_resource_group.school.location
  resource_group_name = azurerm_resource_group.school.name
}
