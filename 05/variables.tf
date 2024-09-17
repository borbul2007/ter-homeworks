variable "ip_addr" {
  type        = string
  default     = "192.168.0.1/32"
  description = "ip-адрес"
  validation {
    condition     = can(cidrhost(var.string_like_valid_ipv4_cidr, 32))
    error_message = "Must be a valid IPv4 CIDR"
  }
}