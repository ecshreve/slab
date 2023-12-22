datacenter = "dcs"
data_dir   = "/opt/consul"

server = true

retry_join = ["10.14.40.140"]

bootstrap_expect = 3

addresses {
  http = "127.0.0.1 {{ GetInterfaceIP \"eth0\" }} {{ GetInterfaceIP \"docker0\" }}"
}

advertise_addr = "{{ GetInterfaceIP \"eth0\" }}"

ports {
  grpc  = 8502
  dns   = 8600
  http  = 8500
  https = 8501
}

ui_config {
  enabled = true
}

telemetry {
  prometheus_retention_time = "24h"
  disable_hostname          = true
}

# Enable script checks
enable_script_checks       = true
enable_local_script_checks = true