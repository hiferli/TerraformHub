terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.0"
    }
  }
}

provider "docker" {}

resource "docker_network" "custom_network1" {
  name = "custom_network1"
}

resource "docker_container" "container_1" {
  name  = "container_1"
  image = "nginx:latest"
  networks_advanced {
    name = docker_network.custom_network1.name
  }
}

resource "docker_container" "container_2" {
  name  = "container_2"
  image = "alpine:latest"
  networks_advanced {
    name = docker_network.custom_network1.name
  }
  command = ["sleep", "3600"]
}