resource "docker_container" "monsters-rolodex" {
  image = docker_image.monsters-rolodex.name
  name  = var.app

  ports {
    internal = 3000
    external = var.external-port
    ip = "0.0.0.0"
  }
}
