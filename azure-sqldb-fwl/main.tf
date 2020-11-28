resource "azurerm_resource_group" "example" {
  name     = "rg-vmwapj-anz"
}

resource "azurerm_sql_firewall_rule" "fwl" {
  name                = "Azure-Allow-All"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = var.server
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
