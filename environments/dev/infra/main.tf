terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 2.0"
    }
  }
  required_version = ">= 0.12"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = "${var.naming_prefix}-rg"
  location = var.region
}

module "virtual_network" {
  source  = "git::https://github.com/aztfmod/terraform-azurerm-caf.git//modules/networking/virtual_network?ref=e09d494a521cb23e30ff7af6ceff2c06b043bab7"
  name    = "${var.naming_prefix}-vnet"
  address_space = var.vnet_address_space
  location = var.region
  resource_group_name = azurerm_resource_group.main.name
}

module "aks" {
  source  = "git::https://github.com/aztfmod/terraform-azurerm-caf.git//modules/compute/aks?ref=e09d494a521cb23e30ff7af6ceff2c06b043bab7"
  name    = "${var.naming_prefix}-aks"
  location = var.region
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix = var.aks_dns_prefix
  agent_pool_profile = var.agent_pool_profile
  network_profile = var.azure_network_profile
  addons_profile = var.addons_profile
}

# Note: Add other required resources or modules here.
