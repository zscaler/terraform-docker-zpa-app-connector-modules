## This is only a sample terraform.tfvars file.
## Uncomment and change the below variables according to your specific environment

#####################################################################################################################
##### Variables 5-13 are populated automically if terraform is ran via ZSAC bash script.  #####
##### Modifying the variables in this file will override any inputs from ZSAC             #####
#####################################################################################################################

#####################################################################################################################
##### Optional: ZPA Provider Resources. Skip to step 3. if you already have an  #####
##### App Connector Group + Provisioning Key.                                   #####
#####################################################################################################################

## 1. ZPA App Connector Provisioning Key variables. Uncomment and replace default values as desired for your deployment.
##    For any questions populating the below values, please reference:
##    https://registry.terraform.io/providers/zscaler/zpa/latest/docs/resources/zpa_provisioning_key

enrollment_cert            = "Connector"
provisioning_key_name      = "docker-prov-key"
provisioning_key_enabled   = true
provisioning_key_max_usage = 10

## 2. ZPA App Connector Group variables. Uncomment and replace default values as desired for your deployment.
##    For any questions populating the below values, please reference:
##    https://registry.terraform.io/providers/zscaler/zpa/latest/docs/resources/zpa_app_connector_group

app_connector_group_name                     = "docker-app-connector-group"
app_connector_group_description              = "docker-app-connector-group"
app_connector_group_enabled                  = true
app_connector_group_country_code             = "US"
app_connector_group_latitude                 = "37.3382082"
app_connector_group_longitude                = "-121.8863286"
app_connector_group_location                 = "San Jose, CA, USA"
app_connector_group_upgrade_day              = "SUNDAY"
app_connector_group_upgrade_time_in_secs     = "66600"
app_connector_group_override_version_profile = true
app_connector_group_version_profile_id       = "2"
app_connector_group_dns_query_type           = "IPV4_IPV6"


#####################################################################################################################
##### Optional: ZPA Provider Resources. Skip to step 5. if you added values for steps 1. and 2. #####
##### meaning you do NOT have a provisioning key already.                                       #####
#####################################################################################################################

## 3. By default, this script will create a new App Connector Group Provisioning Key.
##     Unccoment if you want to use an existing provisioning key (true or false. Default: false)

#byo_provisioning_key                           = true

## 4. Provide your existing provisioning key name. Only uncomment and modify if yo uset byo_provisioning_key to true

#byo_provisioning_key_name                      = "example-key-name"

capabilities = {
  add  = ["cap_net_admin", "cap_net_bind_service", "cap_net_raw", "cap_sys_nice", "cap_sys_time"]
  drop = []
}

## 8. The number of App Connector Containers to Deploy
ac_count = 2
