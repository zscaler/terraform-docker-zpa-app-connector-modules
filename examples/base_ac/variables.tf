variable "name_prefix" {
  type        = string
  description = "The name prefix for all your resources"
  default     = "zsdemo"
}

variable "ac_count" {
  type        = number
  description = "Default number of App Connector Containers to create"
  default     = 2
}


variable "image" {
  description = "Specify the image to start the container from. Can either be a repository/tag or a partial image ID"
  type        = string
  default     = "zscaler/zpa-connector:latest.amd64"
  validation {
    condition = (
      var.image == "zscaler/zpa-connector:latest.amd64" ||
      var.image == "zscaler/zpa-connector:latest.arm64"
    )
    error_message = "Input image must be set to an approved container image architecture."
  }
}


# variable "container_name" {
#   description = "Custom container name"
#   type        = string
#   default     = null
# }

variable "hostname" {
  description = "Set docker hostname"
  type        = string
  default     = null
}

variable "working_dir" {
  description = "Working directory inside the container"
  type        = string
  default     = null
}

variable "restart_policy" {
  description = "Restart policy. Default: always"
  type        = string
  default     = "always"
}

variable "privileged" {
  description = "Give extended privileges to this container"
  type        = bool
  default     = false
}

variable "network_mode" {
  description = "Specify a custom network mode"
  type        = string
  default     = null
}

variable "dns" {
  description = "Set custom dns servers for the container"
  type        = list(string)
  default     = null
}

variable "entrypoint" {
  description = "Override the default entrypoint"
  type        = list(string)
  default     = null
}

variable "command" {
  description = "Override the default command"
  type        = list(string)
  default     = null
}

variable "ports" {
  description = "Expose ports"
  type = list(object({
    internal = number
    external = number
    protocol = string
  }))
  default = null
}

variable "named_volumes" {
  description = "Mount named volumes"
  type = map(object({
    container_path = string
    read_only      = bool
    create         = bool
  }))
  default = {}
}

variable "host_paths" {
  description = "Mount host paths"
  type = map(object({
    container_path = string
    read_only      = bool
  }))
  default = {}
}

variable "volumes_from_containers" {
  description = "Mount volumes from another container"
  type        = list(any)
  default     = null
}

variable "devices" {
  description = "Device mappings"
  type = map(object({
    container_path = string
    permissions    = string
  }))
  default = {}
}

variable "capabilities" {
  description = "Add or drop container capabilities"
  type = object({
    add  = list(string)
    drop = list(string)
  })
  default = null
}


variable "networks_advanced" {
  description = <<EOD
Advanced network options for the container
```hcl
networks_advanced = [
  {
    name         = "proxy-tier"
    ipv4_address = "10.0.0.14"
  },
  {
    name         = "media-tier"
    ipv4_address = "172.0.0.14"
  }
]
```
EOD
  type        = any
  default     = null
}

# variable "healthcheck" {
#   description = "Test to check if container is healthy"
#   type = object({
#     interval     = string
#     retries      = number
#     start_period = string
#     test         = list(string)
#     timeout      = string
#   })
#   default = null
# }


variable "docker_networks" {
  description = <<EOD
List of custom networks to create
```hcl
docker_networks = [
  {
    name = "proxy-tier"
    ipam_config = {
      aux_address = {}
      gateway     = "10.0.0.1"
      subnet      = "10.0.0.0/24"
    }
  }
]
```
EOD
  type        = any
  default     = []
}

# ZPA Provider specific variables for App Connector Group and Provisioning Key creation
variable "provisioning_key_name" {
  type        = string
  description = "Existing App Connector Provisioning Key name"
  default     = "provisioning-key-tf"
}

variable "byo_provisioning_key" {
  type        = bool
  description = "Bring your own App Connector Provisioning Key. Setting this variable to true will effectively instruct this module to not create any resources and only reference data resources from values provided in byo_provisioning_key_name"
  default     = false
}

variable "byo_provisioning_key_name" {
  type        = string
  description = "Existing App Connector Provisioning Key name"
  default     = "provisioning-key-tf"
}

variable "enrollment_cert" {
  type        = string
  description = "Get name of ZPA enrollment cert to be used for App Connector provisioning"
  default     = "Connector"

  validation {
    condition = (
      var.enrollment_cert == "Connector"
    )
    error_message = "Input enrollment_cert must be set to an approved value."
  }
}

variable "app_connector_group_name" {
  type        = string
  description = "Optional: Description of the App Connector Group"
  default     = ""
}

variable "app_connector_group_description" {
  type        = string
  description = "Optional: Description of the App Connector Group"
  default     = ""
}

variable "app_connector_group_enabled" {
  type        = bool
  description = "Whether this App Connector Group is enabled or not"
  default     = true
}

variable "app_connector_group_country_code" {
  type        = string
  description = "Optional: Country code of this App Connector Group. example 'US'"
  default     = ""
}

variable "app_connector_group_latitude" {
  type        = string
  description = "Latitude of the App Connector Group. Integer or decimal. With values in the range of -90 to 90"
  default     = "37.3382082"
}

variable "app_connector_group_longitude" {
  type        = string
  description = "Longitude of the App Connector Group. Integer or decimal. With values in the range of -90 to 90"
  default     = "-121.8863286"
}

variable "app_connector_group_location" {
  type        = string
  description = "location of the App Connector Group in City, State, Country format. example: 'San Jose, CA, USA'"
  default     = "San Jose, CA, USA"
}

variable "app_connector_group_upgrade_day" {
  type        = string
  description = "Optional: App Connectors in this group will attempt to update to a newer version of the software during this specified day. Default value: SUNDAY. List of valid days (i.e., SUNDAY, MONDAY, etc)"
  default     = "SUNDAY"
}

variable "app_connector_group_upgrade_time_in_secs" {
  type        = string
  description = "Optional: App Connectors in this group will attempt to update to a newer version of the software during this specified time. Default value: 66600. Integer in seconds (i.e., 66600). The integer should be greater than or equal to 0 and less than 86400, in 15 minute intervals"
  default     = "66600"
}

variable "app_connector_group_override_version_profile" {
  type        = bool
  description = "Optional: Whether the default version profile of the App Connector Group is applied or overridden. Default: false"
  default     = false
}

variable "app_connector_group_version_profile_id" {
  type        = string
  description = "Optional: ID of the version profile. To learn more, see Version Profile Use Cases. https://help.zscaler.com/zpa/configuring-version-profile"
  default     = "2"

  validation {
    condition = (
      var.app_connector_group_version_profile_id == "0" || #Default = 0
      var.app_connector_group_version_profile_id == "1" || #Previous Default = 1
      var.app_connector_group_version_profile_id == "2"    #New Release = 2
    )
    error_message = "Input app_connector_group_version_profile_id must be set to an approved value."
  }
}

variable "app_connector_group_dns_query_type" {
  type        = string
  description = "Whether to enable IPv4 or IPv6, or both, for DNS resolution of all applications in the App Connector Group"
  default     = "IPV4_IPV6"

  validation {
    condition = (
      var.app_connector_group_dns_query_type == "IPV4_IPV6" ||
      var.app_connector_group_dns_query_type == "IPV4" ||
      var.app_connector_group_dns_query_type == "IPV6"
    )
    error_message = "Input app_connector_group_dns_query_type must be set to an approved value."
  }
}

variable "provisioning_key_enabled" {
  type        = bool
  description = "Whether the provisioning key is enabled or not. Default: true"
  default     = true
}

variable "provisioning_key_association_type" {
  type        = string
  description = "Specifies the provisioning key type for App Connectors or ZPA Private Service Edges. The supported values are CONNECTOR_GRP and SERVICE_EDGE_GRP"
  default     = "CONNECTOR_GRP"

  validation {
    condition = (
      var.provisioning_key_association_type == "CONNECTOR_GRP"
    )
    error_message = "Input provisioning_key_association_type must be set to an approved value."
  }
}

variable "provisioning_key_max_usage" {
  type        = number
  description = "The maximum number of instances where this provisioning key can be used for enrolling an App Connector or Service Edge"
  default     = 10
}
