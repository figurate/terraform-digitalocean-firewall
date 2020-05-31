variable "name" {
  description = "Name of the firewall configuration"
}

variable "tags" {
  description = "A list of tags attached to the firewall"
  type        = list(string)
  default     = []
}

variable "ingress_rules" {
  description = "A list of predefined rules for ingress traffic"
  type        = list(string)
  default     = []
}

variable "egress_rules" {
  description = "A list of predefined rules for egress traffic"
  type        = list(string)
  default     = []
}
