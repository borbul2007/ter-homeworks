variable "token" {
  type        = string
}
variable "cloud_id" {
  type        = string
}
variable "folder_id" {
  type        = string
}

variable "vpc_name" {
  type        = string
  default     = "develop"
}
variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJbFQwlXpyF5D6x8yiptgTG/Are3CfQ94MRINvltKRs2 root@nt.ksob.lan"
}

variable "each_vm" {
  type = set(object({
    name        = string,
    cpu         = number,
    ram         = number,
    disk_volume = number
  }))
  default = [
    { 
       name        = "main"
       cpu         = 2
       ram         = 2
       disk_volume = 10
    },
    {
       name        = "replica"
       cpu         = 2
       ram         = 1
       disk_volume = 20
    }
  ]  
}
