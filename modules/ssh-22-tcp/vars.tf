variable "name" {
  description = "Name of the firewall configuration"
}

variable "tags" {
  description = "A list of tags attached to the firewall"
  type        = list(string)
  default     = []
}
