variable "clickhouse_container_name" {
  description = "Name of the ClickHouse server container"
  type        = string
  default     = "clickhouse-server-tutorial"
}

variable "clickhouse_image" {
  description = "Docker image to use for ClickHouse"
  type        = string
  default     = "yandex/clickhouse-server:latest"
}

variable "clickhouse_port_tcp" {
  description = "TCP native port for ClickHouse"
  type        = number
  default     = 9000
}

variable "clickhouse_port_http" {
  description = "HTTP port for ClickHouse"
  type        = number
  default     = 8123
}

variable "tabix_container_name" {
  description = "Name of the Tabix container"
  type        = string
  default     = "tabix"
}

variable "tabix_image" {
  description = "Docker image to use for Tabix"
  type        = string
  default     = "spoonest/clickhouse-tabix-web-client:latest"
}

variable "tabix_port" {
  description = "Port on the host to expose Tabix"
  type        = number
  default     = 8080
}

variable "docker_network_name" {
  description = "Name of the shared Docker network"
  type        = string
  default     = "clickhouse-network"
}
