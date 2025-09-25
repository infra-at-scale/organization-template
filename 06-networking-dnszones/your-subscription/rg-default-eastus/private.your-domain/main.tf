module "private_dns_zone" {
  source  = "Azure/avm-res-network-privatednszone/azurerm"
  version = "0.4.2"

  domain_name = "private.your-domain"
  parent_id   = data.terraform_remote_state.rg_default_eastus.outputs.resource.id

  tags = {
    Environment = "Non-Prod"
    /* Your other tagging conventions */
  }

  virtual_network_links = {
    vnetlink1 = {
      name                 = data.terraform_remote_state.vnet_default_eastus.outputs.resource.name
      virtual_network_id   = data.terraform_remote_state.vnet_default_eastus.outputs.resource.id
      registration_enabled = true
      tags = {
        Environment = "Non-Prod"
        /* Your other tagging conventions */
      }
    }
  }
}
