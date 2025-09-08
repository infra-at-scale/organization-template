output "application_id" {
  value = azuread_application.this.id
}

output "client_id" {
  value = azuread_application.this.client_id
}

output "service_principal_id" {
  value = azuread_service_principal.this.object_id
}
