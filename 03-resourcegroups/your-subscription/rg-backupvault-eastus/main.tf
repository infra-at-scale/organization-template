module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.2"

  suffix = ["backupvault-${local.location}"]
}

module "rg" {
  source  = "Azure/avm-res-resources-resourcegroup/azurerm"
  version = "0.2.1"

  location = local.location
  name     = module.naming.resource_group.name

  tags = {
    Environment = "Non-Prod"
    /* Your other tagging conventions */
  }

  lock = {
    kind = "CanNotDelete"
    name = "RG delete protection"
  }

  role_assignments = {
    /* Follow module documentation for role assignments */
  }
}
