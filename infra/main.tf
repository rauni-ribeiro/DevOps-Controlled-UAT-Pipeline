terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "=4.1.0"
    }
  }
}

provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "rg" {
  name = var.rg_name
  location = var.location
  tags = var.tags
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
    storage_account_id = azurerm_storage_account.sa.id
    container_access_type = "private"

}