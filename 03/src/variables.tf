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

variable "metadata" {
  type = map(object({
    serial-port-enable = number
    ssh-keys           = string
  }))  
  default = {
    "vm" = {
      serial-port-enable = 1
      ssh-keys           = local.vm_ssh_pub_key
    }  
  }
  description = "metadata"
}

variable "each_vm" {
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    disk_volume = number
  }))
  default = [
    { 
       vm_name     = "main"
       cpu         = 2
       ram         = 2
       disk_volume = 10
    },
    {
       vm_name     = "replica"
       cpu         = 2
       ram         = 1
       disk_volume = 20
    }
  ]  
}
