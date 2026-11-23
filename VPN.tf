resource "azurerm_public_ip" "vpn" {
  name                = "vpn-ip"
  location            = azurerm_resource_group.school.location
  resource_group_name = azurerm_resource_group.school.name

  allocation_method   = "Static"
}
resource "azurerm_virtual_network_gateway" "vpn_gateway" {
  name                = "school-vpngateway"

  location            = azurerm_resource_group.school.location

  resource_group_name = azurerm_resource_group.school.name

  type     = "Vpn"
  vpn_type = "RouteBased"

  sku      = "VpnGw1"
}
