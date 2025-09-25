terraform {
  backend "azurerm" {
    resource_group_name  = "your-resource-group-name"
    storage_account_name = "your-storage-account-name"
    container_name       = "your-container-name"
    key                  = "04-networking-nsgs/your-subscription/rg-default-eastus/nsg-default-eastus/terraform.tfstate"
  }

  required_providers {
    azurerm = "~> 4.45.1"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "your-subscription-id"
}
