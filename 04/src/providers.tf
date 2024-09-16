terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.8.4"

backend "s3" {
  endpoint = { s3 = "storage.yandexcloud.net" }
  bucket = "tfstate-develop-1"
  region = "ru-central1"
  key = "terraform.tfstate"
  skip_region_validation = true
  skip_credentials_validation = true
  dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/b1guau0af4j7qkg1484e/etn42544b31a743m6357"
  dynamodb_table = "tfstate-lock-develop"
}

}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}
