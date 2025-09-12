data "terraform_remote_state" "rg_default_eastus" {
  backend = "azurerm"
  config = {
    resource_group_name  = "your-resource-group-name"
    storage_account_name = "your-storage-account-name"
    container_name       = "your-container-name"
    key                  = "03-resourcegroups/your-subscription/rg-default-eastus/terraform.tfstate"
  }
}

data "terraform_remote_state" "nsg_default_eastus" {
  backend = "azurerm"
  config = {
    resource_group_name  = "your-resource-group-name"
    storage_account_name = "your-storage-account-name"
    container_name       = "your-container-name"
    key                  = "04-networking-nsgs/your-subscription/rg-default-eastus/nsg-default-eastus/terraform.tfstate"
  }
}
