resource "azurerm_virtual_network" "vnet" {
  name                = "school-vnet"
  address_space       = ["10.10.0.0/16"]
  location            = azurerm_resource_group.school.location
  resource_group_name = azurerm_resource_group.school.name
}

resource "azurerm_subnet" "external" {
  name                 = "external-subnet"
  resource_group_name  = azurerm_resource_group.school.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.10.1.0/24"]
}

resource "azurerm_subnet" "internal" {
  name                 = "internal-subnet"
  resource_group_name  = azurerm_resource_group.school.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.10.2.0/24"]
}
