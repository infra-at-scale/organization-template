module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.2"

  suffix = ["default-${data.terraform_remote_state.rg_default_eastus.outputs.resource.location}"]
}

module "nsg" {
  source  = "Azure/avm-res-network-networksecuritygroup/azurerm"
  version = "0.5.0"

  location            = data.terraform_remote_state.rg_default_eastus.outputs.resource.location
  name                = module.naming.network_security_group.name
  resource_group_name = data.terraform_remote_state.rg_default_eastus.outputs.resource.name

  tags = {
    Environment = "Non-Prod"
    /* Your other tagging conventions */
  }

  security_rules = {
    /* Follow module documentation for security rules */
  }
}
