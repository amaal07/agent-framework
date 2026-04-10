
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
  location = "East US"
}

resource "azurerm_sql_server" "example" {
  name                         = "${var.naming_prefix}-sqlserver"
  resource_group_name          = azurerm_resource_group.main.name
  location                     = azurerm_resource_group.main.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssword123"
}

resource "azurerm_sql_database" "example" {
  name                = "${var.naming_prefix}-sqldb"
  resource_group_name = azurerm_resource_group.main.name
  location           = azurerm_sql_server.example.location
  server_name        = azurerm_sql_server.example.name
  requested_service_objective_name = "S0"
}