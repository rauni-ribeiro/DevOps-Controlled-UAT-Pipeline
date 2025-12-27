resource "azurerm_resource_group" "rg" {
  name = var.rg_name
  location = var.location
  tags = var.tags
}

resource "azurerm_storage_blob" "blob" {
  name = "blob-${var.blob_name}"
  storage_account_name = var.storage_account_name
  storage_container_name = azurerm_storage_container.container.name
  type = "Block"
}

resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
  
}

resource "azurerm_storage_container" "container" {
    name = var.container_name
    storage_account_name = azurerm_storage_account.sa.name
    container_access_type = "private"
}