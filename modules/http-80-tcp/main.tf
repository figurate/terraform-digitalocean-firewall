module "http_firewall" {
  source = "../.."

  name = var.name
  ingress_rules = ["http-80-tcp"]
  egress_rules = ["all-tcp"]
}
