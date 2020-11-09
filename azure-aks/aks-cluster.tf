provider "azurerm" {
  version = "~> 2.0"
  features {}
}

resource "azurerm_resource_group" "default" {
  name     = var.clustername
  location = "Australia East"

  tags = {
    environment = var.environment
  }
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = var.clustername
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = var.clustername

  default_node_pool {
    name            = "default"
    node_count      = var.nodecount
    vm_size         = var.vmsize
    os_disk_size_gb = 30
  }
  
  identity {
    type = "SystemAssigned"
  }
  role_based_access_control {
    enabled = true
  }

  tags = {
    environment = var.environment
  }
}