provider "azurerm" {
  version = "~> 2.0"
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "rg-vmwapj-anz"
  location = "Australia East"
}

resource "azurerm_sql_firewall_rule" "fwl" {
  name                = "Azure-Allow-All"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = var.server
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
