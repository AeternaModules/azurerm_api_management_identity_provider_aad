variable "api_management_identity_provider_aads" {
  description = <<EOT
Map of api_management_identity_provider_aads, attributes below
Required:
    - allowed_tenants
    - api_management_name
    - client_id
    - client_secret
    - client_secret_key_vault_id (alternative to client_secret - read from Key Vault instead)
    - client_secret_key_vault_secret_name (alternative to client_secret - read from Key Vault instead)
    - resource_group_name
Optional:
    - client_library
    - signin_tenant
EOT

  type = map(object({
    allowed_tenants                     = list(string)
    api_management_name                 = string
    client_id                           = string
    client_secret                       = string
    client_secret_key_vault_id          = optional(string)
    client_secret_key_vault_secret_name = optional(string)
    resource_group_name                 = string
    client_library                      = optional(string)
    signin_tenant                       = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.api_management_identity_provider_aads : (
        can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.client_id))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_identity_provider_aads : (
        length(v.client_secret) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_identity_provider_aads : (
        can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.allowed_tenants))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_identity_provider_aads : (
        v.client_library == null || (length(v.client_library) >= 0 && length(v.client_library) <= 16)
      )
    ])
    error_message = "must be between 0 and 16 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_identity_provider_aads : (
        v.signin_tenant == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.signin_tenant)))
      )
    ])
    error_message = "must be a valid UUID"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_api_management_identity_provider_aad's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: api_management_name
  #   source:    [from validate.ApiManagementServiceName] !matched
}

