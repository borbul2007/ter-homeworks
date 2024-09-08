resource "yandex_compute_disk" "disk" {
  for_each    = var.each_vm
  name       = "${each.key.name}-disk"
  type       = "network-hdd"
  size       = each.key.disk_volume
}

resource "yandex_compute_instance" "db" {
  for_each    = var.each_vm
  name        = each.key.name
  platform_id = "standard-v1"
  zone        = var.default_zone
  resources {
    cores         = each.key.cpu
    memory        = each.key.ram
    core_fraction = 5
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
#  secondary_disk {
#    disk_id = yandex_compute_disk.disk.${each.key.name}-disk.id
#  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    security_group_ids = [ yandex_vpc_security_group.example.id ]
    nat                = true
  }
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}
