output "api_management_identity_provider_aads_allowed_tenants" {
  description = "Map of allowed_tenants values across all api_management_identity_provider_aads, keyed the same as var.api_management_identity_provider_aads"
  value       = { for k, v in azurerm_api_management_identity_provider_aad.api_management_identity_provider_aads : k => v.allowed_tenants }
}
output "api_management_identity_provider_aads_api_management_name" {
  description = "Map of api_management_name values across all api_management_identity_provider_aads, keyed the same as var.api_management_identity_provider_aads"
  value       = { for k, v in azurerm_api_management_identity_provider_aad.api_management_identity_provider_aads : k => v.api_management_name }
}
output "api_management_identity_provider_aads_client_id" {
  description = "Map of client_id values across all api_management_identity_provider_aads, keyed the same as var.api_management_identity_provider_aads"
  value       = { for k, v in azurerm_api_management_identity_provider_aad.api_management_identity_provider_aads : k => v.client_id }
}
output "api_management_identity_provider_aads_client_library" {
  description = "Map of client_library values across all api_management_identity_provider_aads, keyed the same as var.api_management_identity_provider_aads"
  value       = { for k, v in azurerm_api_management_identity_provider_aad.api_management_identity_provider_aads : k => v.client_library }
}
output "api_management_identity_provider_aads_client_secret" {
  description = "Map of client_secret values across all api_management_identity_provider_aads, keyed the same as var.api_management_identity_provider_aads"
  value       = { for k, v in azurerm_api_management_identity_provider_aad.api_management_identity_provider_aads : k => v.client_secret }
  sensitive   = true
}
output "api_management_identity_provider_aads_resource_group_name" {
  description = "Map of resource_group_name values across all api_management_identity_provider_aads, keyed the same as var.api_management_identity_provider_aads"
  value       = { for k, v in azurerm_api_management_identity_provider_aad.api_management_identity_provider_aads : k => v.resource_group_name }
}
output "api_management_identity_provider_aads_signin_tenant" {
  description = "Map of signin_tenant values across all api_management_identity_provider_aads, keyed the same as var.api_management_identity_provider_aads"
  value       = { for k, v in azurerm_api_management_identity_provider_aad.api_management_identity_provider_aads : k => v.signin_tenant }
}

