output "api_management_identity_provider_aads" {
  description = "All api_management_identity_provider_aad resources"
  value       = azurerm_api_management_identity_provider_aad.api_management_identity_provider_aads
  sensitive   = true
}
output "api_management_identity_provider_aads_allowed_tenants" {
  description = "List of allowed_tenants values across all api_management_identity_provider_aads"
  value       = [for k, v in azurerm_api_management_identity_provider_aad.api_management_identity_provider_aads : v.allowed_tenants]
}
output "api_management_identity_provider_aads_api_management_name" {
  description = "List of api_management_name values across all api_management_identity_provider_aads"
  value       = [for k, v in azurerm_api_management_identity_provider_aad.api_management_identity_provider_aads : v.api_management_name]
}
output "api_management_identity_provider_aads_client_id" {
  description = "List of client_id values across all api_management_identity_provider_aads"
  value       = [for k, v in azurerm_api_management_identity_provider_aad.api_management_identity_provider_aads : v.client_id]
}
output "api_management_identity_provider_aads_client_library" {
  description = "List of client_library values across all api_management_identity_provider_aads"
  value       = [for k, v in azurerm_api_management_identity_provider_aad.api_management_identity_provider_aads : v.client_library]
}
output "api_management_identity_provider_aads_client_secret" {
  description = "List of client_secret values across all api_management_identity_provider_aads"
  value       = [for k, v in azurerm_api_management_identity_provider_aad.api_management_identity_provider_aads : v.client_secret]
  sensitive   = true
}
output "api_management_identity_provider_aads_resource_group_name" {
  description = "List of resource_group_name values across all api_management_identity_provider_aads"
  value       = [for k, v in azurerm_api_management_identity_provider_aad.api_management_identity_provider_aads : v.resource_group_name]
}
output "api_management_identity_provider_aads_signin_tenant" {
  description = "List of signin_tenant values across all api_management_identity_provider_aads"
  value       = [for k, v in azurerm_api_management_identity_provider_aad.api_management_identity_provider_aads : v.signin_tenant]
}

