output "out" {
  value=concat(module.vps_dev.yandex_vpc_subnet)
}