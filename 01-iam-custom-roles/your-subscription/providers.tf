terraform {
  backend "azurerm" {
    resource_group_name  = "your-resource-group-name"
    storage_account_name = "your-storage-account-name"
    container_name       = "your-container-name"
    key                  = "01-iam-custom-roles/your-subscription/terraform.tfstate"
  }

  required_providers {
    azurerm = "~> 4.42.0"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "your-subscription-id"
}
