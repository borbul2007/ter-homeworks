config {
  format           = "compact"
  plugin_dir       = "/tflint/.tflint.d/plugins"
  call_module_type = "local"
}

plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

rule "terraform_module_pinned_source" {
  enabled          = false
  style            = "flexible"
  default_branches = ["main"]
}

rule "terraform_required_providers" {
  enabled = false
  source  = false
  version = false
}
