resource "docker_image" "monsters-rolodex" {
  name = "monsters-rolodex:latest"

  build {
    context = "./../"
    dockerfile = "Dockerfile"
    tag = [var.app]
  }
}
