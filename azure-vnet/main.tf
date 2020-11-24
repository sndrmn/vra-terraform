provider "azurerm" {
  version = "~> 2.0"
  features {}
}

resource "azurerm_virtual_network" "main" {
name                = var.network
resource_group_name = var.rgname
address_space       = var.vnet_address
}

resource "azurerm_subnet" "internal" {
name                    = var.subnetname
resource_group_name     = var.rgname
virtual_network_name    = "${azurerm_virtual_network.main.name}"
address_prefix          = var.subnet_address
}