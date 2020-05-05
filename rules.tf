locals {
  rules = {
    all-tcp = [1, 65535, "tcp", "ALL (TCP)"]

    http-80-tcp   = [80, 80, "tcp", "HTTP"]
    http-8080-tcp = [8080, 8080, "tcp", "HTTP"]

    https-443-tcp  = [443, 443, "tcp", "HTTPS"]
    https-8443-tcp = [8443, 8443, "tcp", "HTTPS"]

    ssh-22-tcp = [22, 22, "tcp", "SSH"]

    dns-53-tcp = [53, 53, "tcp", "DNS (TCP)"]
    dns-53-udp = [53, 53, "udp", "DNS (UDP)"]
  }
}
