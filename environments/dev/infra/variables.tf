variable "region" {
  description = "The Azure region where resources will be created."
  type        = string
  default     = "eastus"
}

variable "naming_prefix" {
  description = "Prefix to be used in resource names."
  type        = string
  default     = "infra"
}

variable "vnet_address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "aks_dns_prefix" {
  description = "The DNS prefix for the AKS cluster."
  type        = string
}

variable "agent_pool_profile" {
  description = "Agent pool configuration for AKS."
  type        = map(string)
}

variable "azure_network_profile" {
  description = "Network profile configuration for AKS."
  type        = map(string)
}

variable "addons_profile" {
  description = "Add-ons for the AKS cluster."
  type        = map(string)
}