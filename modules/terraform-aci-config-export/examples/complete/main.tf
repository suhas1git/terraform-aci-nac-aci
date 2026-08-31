module "aci_config_export" {
  source  = "netascode/nac-aci/aci//modules/terraform-aci-config-export"
  version = ">= 0.8.0"

  name        = "EXP1"
  description = "My Description"
  format      = "xml"
  snapshot    = true
}

module "aci_config_export_remote" {
  source  = "netascode/nac-aci/aci//modules/terraform-aci-config-export"
  version = ">= 0.8.0"

  name            = "EXP2"
  description     = "My Description"
  format          = "xml"
  snapshot        = false
  remote_location = "REMOTE1"
  scheduler       = "SCHEDULER1"
}
