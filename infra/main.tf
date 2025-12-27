terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

provider "azurerm" {
  resource_provider_registrations = "none"
  features {}
}

module "backend_storage" {
  source = "./modules/backend_storage"

  rg_name              = var.rg_name
  location             = var.location
  storage_account_name = var.storage_account_name
  container_name       = var.container_name
  blob_name            = var.blob_name
  tags                 = var.tags
}
