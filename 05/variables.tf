variable "ip_addr" {
  type        = string
  default     = "192.168.0.1"
  description = "ip-адрес"
  validation {
    condition     = can(cidrhost("${var.ip_addr}/32", 0))
    error_message = "Must be a valid IPv4 addr"
  }
}

variable "ip_addr_list" {
  type        = list(string)
  default     = ["192.168.0.1", "192.168.0.2"]
  description = "список ip-адресов"
  validation {
    condition     = alltrue([for ip_addr in var.ip_addr_list : can(cidrhost("${var.ip_addr}/32", 0))])
    error_message = "Must be a valid IPv4 addr"
  }
}