resource "yandex_vpc_network" "vpc_dev" {
  name = "dev"
}

resource "yandex_vpc_subnet" "vpc_subnet_dev" {
  name           = var.env_name
  zone           = var.zone
  network_id     = yandex_vpc_network.vpc_dev.id
  v4_cidr_blocks = var.cidr
}
