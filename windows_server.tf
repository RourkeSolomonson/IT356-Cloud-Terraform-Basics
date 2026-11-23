locals {
  windows_servers = [
    "dc01",
    "dc02",
    "msca01",
    "nps01"
  ]
}
resource "azurerm_network_interface" "windows_nics" {
  count               = 4

  name                = "${local.windows_servers[count.index]}-nic"

  location            = azurerm_resource_group.school.location

  resource_group_name = azurerm_resource_group.school.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_windows_virtual_machine" "windows_vm" {
  count               = 4

  name                = local.windows_servers[count.index]

  resource_group_name = azurerm_resource_group.school.name

  location            = azurerm_resource_group.school.location

  size                = "Standard_B2ms"

  admin_username      = var.admin_username

  admin_password      = var.admin_password

  network_interface_ids = [
    azurerm_network_interface.windows_nics[count.index].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter"
    version   = "latest"
  }
}
