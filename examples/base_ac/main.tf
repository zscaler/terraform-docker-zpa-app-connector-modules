################################################################################
# Generate a unique random string for resource name assignment and key pair
################################################################################
resource "random_string" "suffix" {
  length  = 8
  upper   = false
  special = false
}


################################################################################
# 1. Create ZPA App Connector Group
################################################################################
module "zpa_app_connector_group" {
  count                                        = var.byo_provisioning_key == true ? 0 : 1 # Only use this module if a new provisioning key is needed
  source                                       = "../../modules/terraform-zpa-app-connector-group"
  app_connector_group_name                     = "${var.app_connector_group_name}-${var.name_prefix}"
  app_connector_group_description              = "${var.app_connector_group_description}-${var.name_prefix}"
  app_connector_group_enabled                  = var.app_connector_group_enabled
  app_connector_group_country_code             = var.app_connector_group_country_code
  app_connector_group_latitude                 = var.app_connector_group_latitude
  app_connector_group_longitude                = var.app_connector_group_longitude
  app_connector_group_location                 = var.app_connector_group_location
  app_connector_group_upgrade_day              = var.app_connector_group_upgrade_day
  app_connector_group_upgrade_time_in_secs     = var.app_connector_group_upgrade_time_in_secs
  app_connector_group_override_version_profile = var.app_connector_group_override_version_profile
  app_connector_group_version_profile_id       = var.app_connector_group_version_profile_id
  app_connector_group_dns_query_type           = var.app_connector_group_dns_query_type
}


################################################################################
# 2. Create ZPA Provisioning Key (or reference existing if byo set)
################################################################################
module "zpa_provisioning_key" {
  source                            = "../../modules/terraform-zpa-provisioning-key"
  enrollment_cert                   = var.enrollment_cert
  provisioning_key_name             = "${var.provisioning_key_name}-${var.name_prefix}-zpa"
  provisioning_key_enabled          = var.provisioning_key_enabled
  provisioning_key_association_type = var.provisioning_key_association_type
  provisioning_key_max_usage        = var.provisioning_key_max_usage
  app_connector_group_id            = try(module.zpa_app_connector_group[0].app_connector_group_id, "")
  byo_provisioning_key              = var.byo_provisioning_key
  byo_provisioning_key_name         = var.byo_provisioning_key_name
}

locals {
  provision_key = {
    ZPA_PROVISION_KEY = module.zpa_provisioning_key.provisioning_key
  }
}

module "zpa_connector_docker" {
  source            = "../../modules/terraform-zpa-connector-docker-container"
  ac_count          = var.ac_count
  image             = var.image
  container_name    = "${var.name_prefix}-ac-${random_string.suffix.result}"
  hostname          = var.hostname
  restart_policy    = var.restart_policy
  working_dir       = var.working_dir
  privileged        = var.privileged
  network_mode      = var.network_mode
  dns               = var.dns
  entrypoint        = var.entrypoint
  command           = var.command
  capabilities      = var.capabilities
  environment       = local.provision_key
  docker_networks   = var.docker_networks
  ports             = var.ports
  named_volumes     = var.named_volumes
  host_paths        = var.host_paths
  devices           = var.devices
  networks_advanced = var.networks_advanced
}
