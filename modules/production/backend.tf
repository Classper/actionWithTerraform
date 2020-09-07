terraform {
  backend "azurerm" {
    resource_group_name  = "rg-casper-01"
    storage_account_name = "caspersa01"
    container_name       = "contcasper01"
    key                  = "terraformprod.tfstate"
  }
}