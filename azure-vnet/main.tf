provider "azurerm" {
  version = "~> 2.0"
  features {}
}

resource "azurerm_resource_group" "default" {
  name     = var.rgname
  location = "Australia East"
}

resource "azurerm_virtual_network" "main" {
name                = var.network
location            = azurerm_resource_group.default.location
resource_group_name = azurerm_resource_group.default.name
address_space       = var.vnet_address
}

resource "azurerm_subnet" "internal" {
name                    = var.subnetname
resource_group_name     = azurerm_resource_group.default.name
virtual_network_name    = azurerm_virtual_network.main.name
address_prefixes        = var.subnet_address
}

resource "azurerm_subnet" "internal2" {
name                    = var.subnetname2
resource_group_name     = azurerm_resource_group.default.name
virtual_network_name    = azurerm_virtual_network.main.name
address_prefixes        = var.subnet_address2
}