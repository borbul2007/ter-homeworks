data "yandex_compute_image" "ubuntu" {
  family = var.vm_yandex_compute_image_family
}

resource "yandex_compute_instance" "web" {
  count = 2
  name  = "${local.name}-web-${count.index}"
  platform_id = var.vm_yandex_compute_instance_platform_id
  zone        = var.default_zone-a
  resources {
    cores         = var.vm_resources.cores
    memory        = var.vm_resources.memory
    core_fraction = var.vm_resources.web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop-a.id
    nat       = true
  }
  metadata = {
    serial-port-enable = var.metadata.vm.serial-port-enable
    ssh-keys           = var.metadata.vm.ssh-keys
  }
}
