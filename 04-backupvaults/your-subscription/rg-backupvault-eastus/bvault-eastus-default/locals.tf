locals {
  # Resource abbreviation according to:
  # https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations#storage
  abbreviation = "bvault"

  suffix   = "default"
  fullname = "${local.abbreviation}-${data.terraform_remote_state.rg_backupvault_eastus.outputs.resource.location}-${local.suffix}"
}
