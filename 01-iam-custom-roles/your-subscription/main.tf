resource "azurerm_role_definition" "custom_role" {
  for_each = local.custom_roles

  name        = each.value.roleName
  description = each.value.description
  scope       = local.scope_id

  assignable_scopes = each.value.assignableScopes

  permissions {
    actions          = each.value.permissions[0].actions
    not_actions      = each.value.permissions[0].notActions
    data_actions     = each.value.permissions[0].dataActions
    not_data_actions = each.value.permissions[0].notDataActions
  }
}
