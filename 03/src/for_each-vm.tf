resource "yandex_compute_disk" "disk" {
  for_each   = {for vm in var.each_vm: vm.vm_name => vm}
  name       = "${each.value.vm_name}-disk"
  type       = "network-hdd"
  size       = each.value.disk_volume
}

resource "yandex_compute_instance" "db" {
  for_each   = {for vm in var.each_vm: vm.vm_name => vm}
  name        = each.value.vm_name
  platform_id = "standard-v1"
  zone        = var.default_zone
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = 5
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  secondary_disk {
    disk_id = yandex_compute_disk.disk[each.value.vm_name].id
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    security_group_ids = [ yandex_vpc_security_group.example.id ]
    nat                = true
  }
  metadata = {
    serial-port-enable = var.metadata.vm.serial-port-enable
    ssh-keys           = local.ssh-keys
  }
}
