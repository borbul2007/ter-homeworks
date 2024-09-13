output "vpc_subnet_dev" {
  value = [
    module.vpc_dev.vpc_subnet_dev.name,
    module.vpc_dev.vpc_subnet_dev.zone,
    module.vpc_dev.vpc_subnet_dev.v4_cidr_blocks,
    module.vpc_dev.vpc_subnet_dev.network_id
  ]  
}