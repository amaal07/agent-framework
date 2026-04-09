terraform {
  required_providers {
    azurerm = { source = "hashicorp/azurerm", version = "~> 3.0" }
  }
  backend "azurerm" {}
}

provider "azurerm" { features {} }

resource "azurerm_resource_group" "main" {
  name     = "${var.naming_prefix}-rg"
  location = var.region
}

resource "azurerm_virtual_network" "main" {
  name                = "${var.naming_prefix}-vnet"
  location            = var.region
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.0.0.0/16"]
}