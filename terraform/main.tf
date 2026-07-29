terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 4.2.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = var.imagem
  keep_locally = false
}

resource "docker_container" "poc-operacao-iac" {
  image = docker_image.nginx.image_id
  name  = var.nome_container
  ports {
    internal = 80
    external = var.porta_externa
  }
}
