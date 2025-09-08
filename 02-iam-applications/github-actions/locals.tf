locals {
  application_name = "github-actions"

  federated_credentials = {
    /* key = "owner/repository" */
    organization_template = "infra-at-scale/organization-template"
  }

  role_assignment_scope = "/subscriptions/your-subscription-id"
}
