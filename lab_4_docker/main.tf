locals {
  containers = [
    {
      name = "monday"
      port = 8000
    },
    {
      name = "tuesday"
      port = 8001
    },
    {
      name = "wednesday"
      port = 8002
    },
    {
      name = "thursday"
      port = 8003
    }
  ]
}
resource "docker_container" "docker_apps" {

  image   = "mjbright/docker-demo:1"
  dynamic "foo" {
    for_each = local.containers
    content {
      
      name    = "${container.value.name}_docker_app"
      restart = "always"
      volumes {
        container_path = "/tmp"
        # replace the host_path with full path for your project directory starting from root directory /
        host_path = "/tmp/demo"
        read_only = false
      }
      ports {
        internal = 80
        external = container.value.port
      }

    }
  }

  # not working? tags = { LabName = "4c.Docker" }
} 