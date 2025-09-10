module "backupvault" {
  source  = "Azure/avm-res-dataprotection-backupvault/azurerm"
  version = "0.3.0"

  datastore_type      = "VaultStore"
  location            = data.terraform_remote_state.rg_backupvault_eastus.outputs.resource.location
  name                = local.fullname
  resource_group_name = data.terraform_remote_state.rg_backupvault_eastus.outputs.resource.name
  redundancy          = "ZoneRedundant"
}
