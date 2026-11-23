locals {
  linux_servers = [
    "web01",
    "web02",
    "app01",
    "app02"
  ]
}

resource "azurerm_network_interface" "linux_nics" {
  count = 4

  name                = "${local.linux_servers[count.index]}-nic"
  location            = azurerm_resource_group.school.location
  resource_group_name = azurerm_resource_group.school.name

  ip_configuration {
    name = "internal"

    subnet_id = count.index < 2 ?
      azurerm_subnet.external.id :
      azurerm_subnet.internal.id

    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_linux_virtual_machine" "linux_vm" {
  count               = 4

  name                = local.linux_servers[count.index]

  resource_group_name = azurerm_resource_group.school.name

  location            = azurerm_resource_group.school.location

  size                = "Standard_B2s"

  admin_username      = var.admin_username

  disable_password_authentication = false

  admin_password = var.admin_password

  network_interface_ids = [
    azurerm_network_interface.linux_nics[count.index].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
