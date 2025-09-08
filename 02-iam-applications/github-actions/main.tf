resource "azuread_application" "this" {
  display_name = local.application_name
}

resource "azuread_service_principal" "this" {
  client_id = azuread_application.this.client_id
}

/* OIDC federation */
resource "azuread_application_federated_identity_credential" "this" {
  for_each = local.federated_credentials

  application_id = azuread_application.this.id
  display_name   = each.key
  description    = "OIDC federation for ${each.value}"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://token.actions.githubusercontent.com"
  subject        = "repo:${each.value}:ref:refs/heads/main"
}

/* Optionally if you want to create a client secret for the application the code goes below */

/* Role assignments */
module "role_assignments" {
  source  = "Azure/avm-res-authorization-roleassignment/azurerm"
  version = "0.3.0"

  role_assignments_azure_resource_manager = {
    "${local.application_name}" = {
      principal_id       = azuread_service_principal.this.object_id
      role_definition_id = data.terraform_remote_state.custom_roles_your-subscription.outputs.custom_role_ids[local.application_name]
      scope              = local.role_assignment_scope
    }
  }
}
