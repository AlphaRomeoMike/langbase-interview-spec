terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}


resource "docker_network" "clickhouse_network" {
  name = var.docker_network_name
}


resource "docker_image" "clickhouse_server" {
  name         = var.clickhouse_image
  keep_locally = false
}

resource "docker_container" "clickhouse_server" {
  name         = var.clickhouse_container_name
  image        = docker_image.clickhouse_server.image_id
  network_mode = docker_network.clickhouse_network.name

  ports {
    internal = 9000
    external = var.clickhouse_port_tcp
  }

  ports {
    internal = 8123
    external = var.clickhouse_port_http
  }

  env = [
    "CLICKHOUSE_DB=default",
    "CLICKHOUSE_USER=default",
    "CLICKHOUSE_PASSWORD=password"
  ]

  volumes {
    container_path = "/var/lib/clickhouse"
    host_path      = "/click-house/"
  }

  restart = "unless-stopped"
}


resource "docker_image" "tabix" {
  name         = var.tabix_image
  keep_locally = false
}


resource "docker_container" "tabix" {
  name         = var.tabix_container_name
  image        = docker_image.tabix.image_id
  network_mode = docker_network.clickhouse_network.name

  ports {
    internal = 80
    external = var.tabix_port
  }

  restart = "unless-stopped"

  depends_on = [
    docker_container.clickhouse_server
  ]
}
