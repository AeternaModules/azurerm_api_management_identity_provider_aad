data "azurerm_key_vault_secret" "client_secret" {
  for_each     = { for k, v in var.api_management_identity_provider_aads : k => v if v.client_secret_key_vault_id != null && v.client_secret_key_vault_secret_name != null }
  name         = each.value.client_secret_key_vault_secret_name
  key_vault_id = each.value.client_secret_key_vault_id
}
resource "azurerm_api_management_identity_provider_aad" "api_management_identity_provider_aads" {
  for_each = var.api_management_identity_provider_aads

  allowed_tenants     = each.value.allowed_tenants
  api_management_name = each.value.api_management_name
  client_id           = each.value.client_id
  client_secret       = each.value.client_secret != null ? each.value.client_secret : try(data.azurerm_key_vault_secret.client_secret[each.key].value, null)
  resource_group_name = each.value.resource_group_name
  client_library      = each.value.client_library
  signin_tenant       = each.value.signin_tenant
}

