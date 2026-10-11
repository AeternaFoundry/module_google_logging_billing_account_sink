resource "google_logging_billing_account_sink" "logging_billing_account_sinks" {
  for_each = var.logging_billing_account_sinks

  billing_account = each.value.billing_account
  destination     = each.value.destination
  name            = each.value.name
  deletion_policy = each.value.deletion_policy
  description     = each.value.description
  disabled        = each.value.disabled
  filter          = each.value.filter

  dynamic "bigquery_options" {
    for_each = each.value.bigquery_options != null ? [each.value.bigquery_options] : []
    content {
      use_partitioned_tables = bigquery_options.value.use_partitioned_tables
    }
  }

  dynamic "exclusions" {
    for_each = each.value.exclusions != null ? each.value.exclusions : []
    content {
      description = exclusions.value.description
      disabled    = exclusions.value.disabled
      filter      = exclusions.value.filter
      name        = exclusions.value.name
    }
  }
}

