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

variable "source_addresses" {
  description = "A list of tags from which ingress traffic may originate"
  default     = null
}

variable "source_tags" {
  description = "A list of tags from which ingress traffic may originate"
  default     = null
}

variable "egress_rules" {
  description = "A list of predefined rules for egress traffic"
  type        = list(string)
  default     = []
}

variable "destination_addresses" {
  description = "A list of tags which egress traffic may target"
  default     = null
}

variable "destination_tags" {
  description = "A list of tags which egress traffic may target"
  default     = null
}
