terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.0"
    }
  }
}

provider "docker" {}

resource "docker_network" "custom_networkX31" {
  name = "custom_networkX31"
}

resource "docker_container" "container1" {
  name  = "container1"
  image = "nginx:latest"
  memory = 1024 # Memory limit in megabytes (1GB)
  networks_advanced {
    name = docker_network.custom_networkX31.name
  }
 
   
}

resource "docker_container" "container2" {
  name  = "container2"
  image = "alpine:latest"
  memory = 2048 # Memory limit in megabytes (2GB)
  networks_advanced {
    name = docker_network.custom_networkX31.name
  }
  command = ["sleep", "3600"]
}