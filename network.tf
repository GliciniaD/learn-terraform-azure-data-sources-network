resource "azurerm_resource_group" "network" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "main" {
  name                = "vnet-app"
  address_space       = [var.vnet_cidr_block]
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name
}

resource "azurerm_subnet" "private" {
  count                = 2
  name                 = "snet-private-${count.index}"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.private_subnet_cidr_blocks[count.index]]
}

resource "azurerm_subnet" "public" {
  count                = 2
  name                 = "snet-public-${count.index}"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.public_subnet_cidr_blocks[count.index]]
}

resource "azurerm_network_security_group" "lb" {
  name                = "nsg-lb"
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name
}

resource "azurerm_network_security_group" "app" {
  name                = "nsg-app"
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name
}
