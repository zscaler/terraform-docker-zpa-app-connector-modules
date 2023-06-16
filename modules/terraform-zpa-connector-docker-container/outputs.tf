output "image" {
  description = "The name of the Docker image, including any tags or SHA256 repo digests."
  value       = docker_image.zpa_connector_image[*].name
}

output "container_name" {
  description = "The name of the container."
  value       = docker_container.zpa_connector_container[*].name
}

output "hostname" {
  description = "Hostname of the container."
  value       = docker_container.zpa_connector_container[*].hostname
}

output "working_dir" {
  description = "The working directory for commands to run in."
  value       = docker_container.zpa_connector_container[*].working_dir
}

output "restart" {
  description = "The restart policy for the container. Must be one of 'no', 'on-failure', 'always', 'unless-stopped'. Defaults to no"
  value       = docker_container.zpa_connector_container[*].restart
}

output "privileged" {
  description = "If true, the container runs in privileged mode."
  value       = docker_container.zpa_connector_container[*].privileged
}

output "network_mode" {
  description = "Network mode of the container."
  value       = docker_container.zpa_connector_container[*].network_mode
}

output "dns" {
  description = "DNS servers to use."
  value       = docker_container.zpa_connector_container[*].dns
}

output "entrypoint" {
  description = <<-EOF
  The command to use as the Entrypoint for the container.
  The Entrypoint allows you to configure a container to run as an executable.
  For example, to run /usr/bin/myprogram when starting a container, set the entrypoint to be "/usr/bin/myprogra"].
  EOF
  value       = docker_container.zpa_connector_container[*].entrypoint
}

output "command" {
  description = <<-EOF
  The command to use to start the container.
  For example, to run /usr/bin/myprogram -f baz.conf set the command to be ["/usr/bin/myprogram","-f","baz.con"].
  EOF
  value       = docker_container.zpa_connector_container[*].command
}

output "ports" {
  description = "Publish a container's port(s) to the host."
  value       = docker_container.zpa_connector_container[*].ports
}

output "volumes" {
  description = "Spec for mounting volumes in the container."
  value       = docker_container.zpa_connector_container[*].volumes
}

output "healthcheck" {
  description = "A test to perform to check that the container is healthy"
  value       = docker_container.zpa_connector_container[*].healthcheck
}

output "environment" {
  description = "Environment variables to set in the form of KEY=VALUE, e.g. DEBUG=0"
  value       = docker_container.zpa_connector_container[*].env
}

output "devices" {
  description = "Bind devices to the container"
  value       = docker_container.zpa_connector_container[*].devices
}

output "capabilities" {
  description = "Add or drop certrain linux capabilities."
  value       = docker_container.zpa_connector_container[*].capabilities
}

output "networks_advanced" {
  description = "The networks the container is attached to"
  value       = docker_container.zpa_connector_container[*].networks_advanced
}

output "docker_volumes" {
  description = "Creates and destroys a volume in Docker. "
  value       = docker_volume.zpa_connector_volume
}

output "docker_networks" {
  description = "provides a docker network resource."
  value       = docker_network.zpa_connector_network
}
