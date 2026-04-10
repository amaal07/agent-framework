output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "sql_database_name" {
  value = azurerm_sql_database.main.name
}

output "sql_server_name" {
  value = azurerm_sql_server.main.name
}