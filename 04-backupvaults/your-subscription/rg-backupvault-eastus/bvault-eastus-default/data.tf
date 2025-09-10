data "terraform_remote_state" "rg_backupvault_eastus" {
  backend = "azurerm"
  config = {
    resource_group_name  = "your-resource-group-name"
    storage_account_name = "your-storage-account-name"
    container_name       = "your-container-name"
    key                  = "03-resourcegroups/your-subscription/rg-backupvault-eastus/terraform.tfstate"
  }
}
