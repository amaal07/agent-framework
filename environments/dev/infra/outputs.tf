output "aks_name" {
  description = "The Name of the AKS Cluster"
  value       = module.aks.name
}

output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = module.virtual_network.id
}

output "vnet_address_space" {
  description = "The Address Space of the Virtual Network"
  value       = module.virtual_network.address_space
}