module "firewall" {
  source = "../.."

  name             = var.name
  tags             = var.tags
  ingress_rules    = ["ssh-22-tcp"]
  source_addresses = var.source_addresses
  source_tags      = var.source_tags
  egress_rules     = ["all-tcp"]
}
