module "firewall" {
  source = "../.."

  name          = var.name
  tags          = var.tags
  ingress_rules = ["ssh-22-tcp"]
  egress_rules  = ["all-tcp"]
}
