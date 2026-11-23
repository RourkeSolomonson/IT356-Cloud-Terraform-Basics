locals {
  windows_servers = [
    "dc01",
    "dc02",
    "msca01",
    "nps01"
  ]
}

resource "azurerm_windows_virtual_machine" "windows" {
  count               = length(local.windows_servers)

  name                = local.windows_servers[count.index]
  resource_group_name = azurerm_resource_group.school.name
  location            = azurerm_resource_group.school.location

  size                = "Standard_B2ms"

  admin_username      = "azureadmin"
  admin_password      = "Password123!"

  network_interface_ids = [
    azurerm_network_interface.windows[count.index].id
  ]
}
