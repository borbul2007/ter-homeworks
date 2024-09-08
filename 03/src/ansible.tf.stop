resource "local_file" "hosts_yaml" {
  content =  <<-EOT
  all:
    hosts:
    %{ for i in local.instances_yaml ~}
  ${i["name"]}:
          ansible_host: ${i["network_interface"][0]["nat_ip_address"]}
          ansible_user: ubuntu
    %{ endfor ~}
  EOT
  filename = "${abspath(path.module)}/hosts.yaml"