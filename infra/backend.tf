terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "tfstatestorage2025rauni"
    container_name       = "tfstate"
    key                  = "devops-project/terraform.tfstate"
  }
}