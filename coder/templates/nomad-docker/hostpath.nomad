job "hostpath-csi-plugin" {
  datacenters = ["dcs"]
  type = "service"

  group "csi" {
    task "plugin" {
      driver = "docker"

      config {
        image = "registry.k8s.io/sig-storage/hostpathplugin:v1.10.0"

        args = [
          "--drivername=csi-hostpath",
          "--v=5",
          "--endpoint=${CSI_ENDPOINT}",
          "--nodeid=node-${NOMAD_ALLOC_INDEX}",
        ]

        privileged = true
      }

      csi_plugin {
        id   = "hostpath"
        type = "monolith"
        mount_dir = "/csi"
      }

      resources {
        cpu    = 256
        memory = 128
      }
    }
  }
}