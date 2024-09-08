resource "yandex_compute_instance" "web" {
  count       = 2
  depends_on  = [yandex_compute_instance.db]
  name        = "web-${count.index}"
  platform_id = "standard-v1"
  zone        = var.default_zone
  resources {
    cores         = 2
    memory        = 1
    core_fraction = 5
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
    security_group_ids = [ yandex_vpc_security_group.example.id ]
    nat                = true
  }
  metadata = {
    serial-port-enable = 1
    ssh-keys           = local.ssh_pub_key
  }
}
