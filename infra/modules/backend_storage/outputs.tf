output "rg_name" {
    value = azurerm_resource_group.rg.name
}

output "storage_account_name" {
    value = azurerm_storage_account.sa.name
}

output "container_name" {
    value = azurerm_storage_container.container.name
}