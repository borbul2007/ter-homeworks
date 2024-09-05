data "yandex_compute_image" "ubuntu" {
  family = var.vm_yandex_compute_image_family
}

resource "yandex_compute_instance" "web" {
  count = 2
  name  = "${var.vm_yandex_compute_instance_name}-${count.index}"
  platform_id = var.vm_yandex_compute_instance_platform_id
  zone        = var.default_zone
  resources {
    cores         = var.vm_yandex_compute_instance_resources_cores
    memory        = var.vm_yandex_compute_instance_resources_memory
    core_fraction = var.vm_yandex_compute_instance_resources_core_fraction
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
    subnet_id          = yandex_vpc_subnet.develop.id
    security_group_ids = "${yandex_vpc_security_group.example.id}"
    nat                = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.vms_ssh_root_key}"
  }
}
