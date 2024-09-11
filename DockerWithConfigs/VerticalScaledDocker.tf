terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.0"
    }
  }
}

provider "docker" {}

resource "docker_network" "custom_networkScaling1" {
  name = "custom_networkScaling1"
}

resource "docker_container" "nginx_container" {
  count = 3

  name  = "nginx_container_${count.index + 1}"
  image = "nginx:latest"

  networks_advanced {
    name = docker_network.custom_networkScaling1.name
  }
}