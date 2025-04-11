clickhouse_container_name = "clickhouse"
clickhouse_image          = "yandex/clickhouse-server:latest"
clickhouse_port_tcp       = 9001
clickhouse_port_http      = 8124

tabix_container_name = "tabix"
tabix_image          = "spoonest/clickhouse-tabix-web-client:latest"
tabix_port           = 8081

docker_network_name = "custom-clickhouse-net"
