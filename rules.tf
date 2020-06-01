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

    ntp-123-udp = [123, 123, "udp", "NTP (UDP)"]

    nfs-2049-tcp = [2049, 2049, "tcp", "NFS (TCP)"]

    ipsec-4500-udp = [4500, 4500, "udp", "IPSEC NAT (UDP)"]
    ipsec-500-udp = [500, 500, "udp", "IPSEC IKE (UDP)"]

    l2tp-1701-udp = [1701, 1701, "udp", "L2TP (UDP)"]

    squid-proxy-3128-tcp = [3128, 3128, "tcp", "Squid Proxy (TCP)"]
  }
}
