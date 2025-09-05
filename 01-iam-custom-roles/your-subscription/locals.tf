locals {
  role_files = fileset("${path.module}/roles", "*.json")

  custom_roles = {
    for filename in local.role_files :
    trimsuffix(filename, ".json") => jsondecode(file("${path.module}/roles/${filename}")).properties
  }
  scope_id = "/subscriptions/your-subscription-id"
}
