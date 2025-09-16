module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.2"

  suffix = ["default-${data.terraform_remote_state.rg_default_eastus.outputs.resource.location}"]
}

module "kv" {
  source  = "Azure/avm-res-keyvault-vault/azurerm"
  version = "0.10.1"

  location            = data.terraform_remote_state.rg_default_eastus.outputs.resource.location
  name                = module.naming.key_vault.name
  resource_group_name = data.terraform_remote_state.rg_default_eastus.outputs.resource.name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  tags = {
    Environment = "Non-Prod"
    /* Your other tagging conventions */
  }

  role_assignments = {
    /* Follow module documentation for role assignments */
  }
}
