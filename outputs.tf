output "api_management_identity_provider_aads_id" {
  description = "Map of id values across all api_management_identity_provider_aads, keyed the same as var.api_management_identity_provider_aads"
  value       = { for k, v in azurerm_api_management_identity_provider_aad.api_management_identity_provider_aads : k => v.id if v.id != null && length(v.id) > 0 }
}
output "api_management_identity_provider_aads_allowed_tenants" {
  description = "Map of allowed_tenants values across all api_management_identity_provider_aads, keyed the same as var.api_management_identity_provider_aads"
  value       = { for k, v in azurerm_api_management_identity_provider_aad.api_management_identity_provider_aads : k => v.allowed_tenants if v.allowed_tenants != null && length(v.allowed_tenants) > 0 }
}
output "api_management_identity_provider_aads_api_management_name" {
  description = "Map of api_management_name values across all api_management_identity_provider_aads, keyed the same as var.api_management_identity_provider_aads"
  value       = { for k, v in azurerm_api_management_identity_provider_aad.api_management_identity_provider_aads : k => v.api_management_name if v.api_management_name != null && length(v.api_management_name) > 0 }
}
output "api_management_identity_provider_aads_client_id" {
  description = "Map of client_id values across all api_management_identity_provider_aads, keyed the same as var.api_management_identity_provider_aads"
  value       = { for k, v in azurerm_api_management_identity_provider_aad.api_management_identity_provider_aads : k => v.client_id if v.client_id != null && length(v.client_id) > 0 }
}
output "api_management_identity_provider_aads_client_library" {
  description = "Map of client_library values across all api_management_identity_provider_aads, keyed the same as var.api_management_identity_provider_aads"
  value       = { for k, v in azurerm_api_management_identity_provider_aad.api_management_identity_provider_aads : k => v.client_library if v.client_library != null && length(v.client_library) > 0 }
}
output "api_management_identity_provider_aads_client_secret" {
  description = "Map of client_secret values across all api_management_identity_provider_aads, keyed the same as var.api_management_identity_provider_aads"
  value       = { for k, v in azurerm_api_management_identity_provider_aad.api_management_identity_provider_aads : k => v.client_secret if v.client_secret != null && length(v.client_secret) > 0 }
  sensitive   = true
}
output "api_management_identity_provider_aads_resource_group_name" {
  description = "Map of resource_group_name values across all api_management_identity_provider_aads, keyed the same as var.api_management_identity_provider_aads"
  value       = { for k, v in azurerm_api_management_identity_provider_aad.api_management_identity_provider_aads : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "api_management_identity_provider_aads_signin_tenant" {
  description = "Map of signin_tenant values across all api_management_identity_provider_aads, keyed the same as var.api_management_identity_provider_aads"
  value       = { for k, v in azurerm_api_management_identity_provider_aad.api_management_identity_provider_aads : k => v.signin_tenant if v.signin_tenant != null && length(v.signin_tenant) > 0 }
}

