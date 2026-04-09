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