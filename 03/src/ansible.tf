resource "local_file" "hosts_teplatefiles" {
  content = templatefile("${path.module}/hosts.tftpl",
  
  { webservers = yandex_compute_instance.web },
  { db = yandex_compute_instance.db },
  { storage = yandex_compute_instance.storage }
  )

  filename = "${abspath(path.module)}/hosts.cfg"
}