variable "ip_addr" {
  type        = string
  default     = "192.168.0.1"
#  default     = "1920.1680.0.1"
  description = "ip-адрес"
  validation {
    condition     = can(cidrhost("${var.ip_addr}/32", 0))
    error_message = "Must be a valid IPv4 addr"
  }
}

variable "ip_addr_list" {
  type        = list(string)
  default     = ["192.168.0.1", "1.1.1.1", "127.0.0.1"]
#  default     = ["192.168.0.1", "1.1.1.1", "1270.0.0.1"]
  description = "список ip-адресов"
  validation {
    condition     = alltrue([for ip_addr in var.ip_addr_list : can(cidrhost("${ip_addr}/32", 0))])
    error_message = "Must be a valid IPv4 addr"
  }
}