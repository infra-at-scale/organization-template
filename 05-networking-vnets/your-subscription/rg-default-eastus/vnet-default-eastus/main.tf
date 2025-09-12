module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.2"

  suffix = ["default-${data.terraform_remote_state.rg_default_eastus.outputs.resource.location}"]
}

module "vnet" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "0.10.0"

  address_space       = ["10.0.0.0/16"]
  location            = data.terraform_remote_state.rg_default_eastus.outputs.resource.location
  name                = module.naming.virtual_network.name
  resource_group_name = data.terraform_remote_state.rg_default_eastus.outputs.resource.name
  subnets = {
    "${module.naming.subnet.name}-1" = {
      name             = "${module.naming.subnet.name}-1"
      address_prefixes = ["10.0.0.0/24"]

      network_security_group = data.terraform_remote_state.nsg_default_eastus.outputs.resource
    }
    "${module.naming.subnet.name}-2" = {
      name             = "${module.naming.subnet.name}-2"
      address_prefixes = ["10.0.1.0/24"]

      network_security_group = data.terraform_remote_state.nsg_default_eastus.outputs.resource
    }
  }

  tags = {
    Environment = "Non-Prod"
    /* Your other tagging conventions */
  }

  role_assignments = {
    /* Follow module documentation for role assignments */
  }
}
