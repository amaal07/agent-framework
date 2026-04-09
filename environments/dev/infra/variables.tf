variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "my-resource-group" # Replace with your desired default
}

variable "location" {
  description = "The Azure region where the resource group should be created."
  type        = string
  default     = "eastus"
}