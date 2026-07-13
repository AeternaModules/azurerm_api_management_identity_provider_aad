variable "api_management_identity_provider_aads" {
  description = <<EOT
Map of api_management_identity_provider_aads, attributes below
Required:
    - allowed_tenants
    - api_management_name
    - client_id
    - client_secret
    - client_secret_key_vault_id (optional, alternative to client_secret)
    - client_secret_key_vault_secret_name (optional, alternative to client_secret)
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
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_identity_provider_aads : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_identity_provider_aads : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
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
        alltrue([for x in v.allowed_tenants : can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", x))])
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
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

