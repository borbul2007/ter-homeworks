variable "ip_addr" {
  type        = string
  default     = "192.168.0.1"
  description = "ip-адрес"
  validation {
    condition     = can(cidrhost(var.ip_addr, 0))
    error_message = "Must be a valid IPv4 addr"
  }
}