locals {
  linux_servers = [
    "web01",
    "web02",
    "app01",
    "app02"
  ]
}

resource "azurerm_linux_virtual_machine" "linux" {
  count               = length(local.linux_servers)

  name                = local.linux_servers[count.index]
  resource_group_name = azurerm_resource_group.school.name
  location            = azurerm_resource_group.school.location

  size                = "Standard_B2s"

  admin_username      = "azureadmin"

  disable_password_authentication = true
}
