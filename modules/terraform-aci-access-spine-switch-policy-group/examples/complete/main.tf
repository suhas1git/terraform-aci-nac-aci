module "aci_access_spine_switch_policy_group" {
  source  = "netascode/nac-aci/aci//modules/terraform-aci-access-spine-switch-policy-group"
  version = "> 1.2.1"

  name            = "SW-PG1"
  lldp_policy     = "LLDP-ON"
  cdp_policy      = "CDP-ON"
  bfd_ipv4_policy = "BFD-IPV4-POLICY"
  bfd_ipv6_policy = "BFD-IPV6-POLICY"
}
