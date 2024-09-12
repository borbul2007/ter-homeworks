output "vpc_subnet_dev" {
  value = [
    yandex_vpc_subnet.vpc_subnet_dev[*].name
    yandex_vpc_subnet.vpc_subnet_dev[*].v4_cidr_blocks
    yandex_vpc_subnet.vpc_subnet_dev[*].zone
    yandex_vpc_subnet.vpc_subnet_dev[*].network_id
}
