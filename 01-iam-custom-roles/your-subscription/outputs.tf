output "custom_role_ids" {
  description = "Map of custom role names to their role_definition_resource_ids"
  value = {
    for role_name, role in azurerm_role_definition.custom_role :
    role_name => role.role_definition_resource_id
  }
}
