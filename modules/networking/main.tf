resource "azurerm_virtual_network" "main" {
  name                = "vnet-one"
  resource_group_name = var.group
  location            = var.location
  address_space       = var.address_space
}

resource "azurerm_subnet" "subnet-api" {
  name                 = "testsubnet"
  resource_group_name  = var.group
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.mysubnet[0].address_prefix]
}

resource "azurerm_subnet" "subnet-data" {
  name                 = "subnetdata"
  resource_group_name  = var.group
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.mysubnet[1].address_prefix]
}