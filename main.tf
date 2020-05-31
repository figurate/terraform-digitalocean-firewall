/**
 * # ![Digital Ocean](do-logo.png) Firewall
 *
 * Purpose: Provision Firewall in Digital Ocean.
 *
 * Rationale: Provide templates for Digital Ocean Firewalls.
 */
resource "digitalocean_firewall" "firewall" {
  name = var.name
  tags = var.tags

  dynamic "inbound_rule" {
    for_each = var.ingress_rules
    content {
      port_range = format("%s-%s", local.rules[inbound_rule.value][0], local.rules[inbound_rule.value][1])
      protocol   = local.rules[inbound_rule.value][2]

    }
  }

  dynamic "outbound_rule" {
    for_each = var.egress_rules
    content {
      port_range = format("%s-%s", local.rules[outbound_rule.value][0], local.rules[outbound_rule.value][1])
      protocol   = local.rules[outbound_rule.value][2]
    }
  }
}
