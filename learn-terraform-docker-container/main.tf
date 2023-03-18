terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "nodejs-image" {
  name         = "janak21/nodejs-image"
  keep_locally = false
}

resource "docker_container" "weather-app" {
  image = docker_image.nodejs-image.name
  name  = var.container_name
  hostname = "learn-terraform-docker"
  ports {
    internal = 8080
    external = 80
  }
}
