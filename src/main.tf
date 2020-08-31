#Create the RG
resource "azurerm_resource_group" "main" {
  name = "rg-casper-vnet"
  location = "westeurope"
}

module "vnet" {
    source = "../modules/networking"
    group = azurerm_resource_group.main.name
    location = azurerm_resource_group.main.location
    address_space = ["10.0.0.0/16"]
    mysubnet = [{
      name = "subnet-data"
      address_prefix = "10.0.1.0/24"
    },
    {
      name = "subnet-api"
      address_prefix = "10.0.2.0/24"
    }]
}

resource "azurerm_subnet" "api" {
  name                 = "subnet-vm"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = module.vnet.vnet_name
  address_prefixes     = ["10.0.3.0/24"]
}