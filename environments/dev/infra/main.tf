terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source              = "git::https://github.com/aztfmod/terraform-azurerm-caf//modules/resource_group?ref=main"
  resource_group_name = var.resource_group_name
  location            = var.location
}