terraform {
  required_providers {
    docker = {
      #source = "terraform-providers/docker"
      source = "kreuzwerker/docker"
    }
  }
  required_version = ">= 1.0"
}
provider "docker" {
  host = "unix:///var/run/docker.sock"
}