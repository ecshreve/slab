datacenter = "dcs"
data_dir   = "/opt/nomad/data"

client {
  enabled = true
}

server {
  enabled          = true
  bootstrap_expect = 3
}

ui {
  enabled = true
}

consul {
  address = "127.0.0.1:8500"
}

plugin "exec" {
  config {
    allow_caps = ["audit_write", "chown", "dac_override", "fowner", "fsetid", "kill", "mknod",
    "net_bind_service", "setfcap", "setgid", "setpcap", "setuid", "sys_chroot"]
  }
}

plugin "docker" {
  config {
    pull_activity_timeout = "5m",
    allow_privileged      = true
    allow_caps = [
      "audit_write",
      "chown",
      "dac_override",
      "fowner",
      "fsetid",
      "kill",
      "mknod",
      "net_bind_service",
      "setfcap",
      "setgid",
      "setpcap",
      "setuid",
      "sys_chroot",
      "net_raw",
      "net_admin",
      "net_broadcast",
    ]

    volumes {
      enabled = true
    }
  }
}

telemetry {
  collection_interval        = "1s"
  disable_hostname           = true
  prometheus_metrics         = true
  publish_allocation_metrics = true
  publish_node_metrics       = true
}