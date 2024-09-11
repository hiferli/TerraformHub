terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.0"
    }
  }
}

provider "docker" {
  
}

resource "docker_image" "nginx_image" {
  name = "my_nginx_image:latest"
  build {
    context    = "${path.module}"
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "nginx_container" {
  name  = "nginx_container"
  image = docker_image.nginx_image.latest
  ports {
    internal = 80
    external = 8080
  }
}