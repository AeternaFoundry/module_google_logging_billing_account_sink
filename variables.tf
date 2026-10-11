variable "logging_billing_account_sinks" {
  description = <<EOT
Map of logging_billing_account_sinks, attributes below
Required:
    - billing_account
    - destination
    - name
Optional:
    - deletion_policy
    - description
    - disabled
    - filter
    - bigquery_options (block):
        - use_partitioned_tables (required)
    - exclusions (block):
        - description (optional)
        - disabled (optional)
        - filter (required)
        - name (required)
EOT

  type = map(object({
    billing_account = string
    destination     = string
    name            = string
    deletion_policy = optional(string)
    description     = optional(string)
    disabled        = optional(bool)
    filter          = optional(string)
    bigquery_options = optional(object({
      use_partitioned_tables = bool
    }))
    exclusions = optional(list(object({
      description = optional(string)
      disabled    = optional(bool)
      filter      = string
      name        = string
    })))
  }))
}

