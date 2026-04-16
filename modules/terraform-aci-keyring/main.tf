resource "aci_rest_managed" "pkiKeyRing" {
  dn         = "uni/userext/pkiext/keyring-${var.name}"
  class_name = "pkiKeyRing"
  content = merge(
    {
      name  = var.name
      descr = var.description
      tp    = var.ca_certificate
      cert  = var.certificate
      key   = var.private_key
    },
    var.modulus != null && var.modulus != "" ? { modulus = var.modulus } : {}
  )

  lifecycle {
    ignore_changes = [content["cert"], content["key"]]
  }
}
