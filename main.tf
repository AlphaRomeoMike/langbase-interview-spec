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
  name = "clickhouse-network"
}

resource "docker_image" "clickhouse_server" {
  name         = "yandex/clickhouse-server:latest"
  keep_locally = false
}

resource "docker_container" "clickhouse_server" {
  image = docker_image.clickhouse_server.image_id
  name  = "clickhouse-server-tutorial"
  network_mode = docker_network.clickhouse_network.name

  ports {
    internal = 9000
    external = 9000
  }

  ports {
    internal = 8123
    external = 8123
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