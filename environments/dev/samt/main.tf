terraform {
  required_providers {
    azurerm = { source = "hashicorp/azurerm", version = "~> 3.0" }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = "amaltest-rg"
  location = var.region
}

resource "azurerm_sql_server" "main" {
  name                         = "amaltest-sqlserver"
  resource_group_name          = azurerm_resource_group.main.name
  location                     = var.region
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd123"
}

resource "azurerm_sql_database" "main" {
  name                = "amaltest-sqldb"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.region
  server_name         = azurerm_sql_server.main.name
  edition            = "Basic"
  requested_service_objective_name = "Basic"
}