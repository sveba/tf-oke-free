resource "oci_budget_budget" "free_budget" {
  amount         = 1
  compartment_id = var.compartment_id
  reset_period   = "MONTHLY"
  target_type    = "COMPARTMENT"
  targets        = [var.compartment_id]
  display_name   = "Free"
}

resource "oci_budget_alert_rule" "free_alert_rule" {
  budget_id      = oci_budget_budget.free_budget.id
  threshold      = 50
  threshold_type = "PERCENTAGE"
  type           = "FORECAST"

  description  = "We want to be free of charge"
  display_name = "Free"
  recipients   = var.budget_alarm_email
}