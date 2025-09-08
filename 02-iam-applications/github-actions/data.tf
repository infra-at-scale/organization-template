data "terraform_remote_state" "custom_roles_your-subscription" {
  backend = "azurerm"
  config = {
    resource_group_name  = "your-resource-group-name"
    storage_account_name = "your-storage-account-name"
    container_name       = "your-container-name"
    key                  = "01-iam-custom-roles/your-subscription/terraform.tfstate"
  }
}
