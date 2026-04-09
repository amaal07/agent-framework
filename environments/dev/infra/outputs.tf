output "resource_group_id" {
  description = "The ID of the resource group."
  value       = azurerm_resource_group.infra.id
}

output "resource_group_location" {
  description = "The location of the resource group."
  value       = azurerm_resource_group.infra.location
}