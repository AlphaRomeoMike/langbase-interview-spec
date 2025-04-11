output "clickhouse_http_url" {
  description = "HTTP interface for ClickHouse server"
  value       = "http://localhost:${var.clickhouse_port_http}"
}

output "clickhouse_native_port" {
  description = "TCP native interface for ClickHouse server"
  value       = var.clickhouse_port_tcp
}

output "tabix_ui_url" {
  description = "Web UI URL for Tabix"
  value       = "http://localhost:${var.tabix_port}"
}
