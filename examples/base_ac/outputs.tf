
/*
locals {

  testbedconfig = <<TB

2) Provisioning Key String
"${module.zpa_provisioning_key.provisioning_key}"

3) ZPA Docker Image Name
"${module.zpa_connector_docker.image}"

4) ZPA Container Name
"${module.zpa_connector_docker.container_name}"

5) ZPA Container Name
"${module.zpa_connector_docker.hostname}"

6) ZPA Container Name
"${module.zpa_connector_docker.hostname}"

7) ZPA Container Working Directory
"${module.zpa_connector_docker.working_dir}"

8) ZPA Container Restart
"${module.zpa_connector_docker.restart}"

9) ZPA Container Privilege
"${module.zpa_connector_docker.privileged}"

10) ZPA Container Network Mode
"${module.zpa_connector_docker.network_mode}"

11) ZPA Container DNS
"${module.zpa_connector_docker.dns}"

12) ZPA Container Entrypoint
"${module.zpa_connector_docker.entrypoint}"

13) ZPA Container Command
"${module.zpa_connector_docker.command}"

14) ZPA Container Ports
"${module.zpa_connector_docker.ports}"

15) ZPA Container Volumes
"${module.zpa_connector_docker.volumes}"

16) ZPA Container Devices
"${module.zpa_connector_docker.devices}"

17) ZPA Container Capabilities
"${module.zpa_connector_docker.capabilities}"

18) ZPA Container Networks Advanced
"${module.zpa_connector_docker.networks_advanced}"

19) ZPA Container Healthcheck
"${module.zpa_connector_docker.healthcheck}"

20) ZPA Container Environment
"${module.zpa_connector_docker.docker_networks}"


TB
}

output "testbedconfig" {
  description = "AWS Testbed results"
  value       = local.testbedconfig
}

resource "local_file" "testbed" {
  content  = local.testbedconfig
  filename = "../testbed.txt"
}
*/
