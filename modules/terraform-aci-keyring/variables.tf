variable "name" {
  description = "Keyring name."
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9_.:-]{0,64}$", var.name))
    error_message = "Allowed characters: `a`-`z`, `A`-`Z`, `0`-`9`, `_`, `.`, `:`, `-`. Maximum characters: 64."
  }
}

variable "description" {
  description = "Description."
  type        = string
  default     = ""

  validation {
    condition     = can(regex("^[a-zA-Z0-9\\\\!#$%()*,-./:;@ _{|}~?&+]{0,128}$", var.description))
    error_message = "Allowed characters: `a`-`z`, `A`-`Z`, `0`-`9`, `\\`, `!`, `#`, `$`, `%`, `(`, `)`, `*`, `,`, `-`, `.`, `/`, `:`, `;`, `@`, ` `, `_`, `{`, `|`, }`, `~`, `?`, `&`, `+`. Maximum characters: 128."
  }
}

variable "ca_certificate" {
  description = "CA certificate name."
  type        = string
  default     = ""

  validation {
    condition     = can(regex("^[a-zA-Z0-9_.:-]{0,64}$", var.ca_certificate))
    error_message = "Allowed characters: `a`-`z`, `A`-`Z`, `0`-`9`, `_`, `.`, `:`, `-`. Maximum characters: 64."
  }
}

variable "certificate" {
  description = "Certificate."
  type        = string
  default     = ""
}

variable "private_key" {
  description = "Private key."
  type        = string
  default     = null
  sensitive   = true
}

variable "modulus" {
  description = "RSA modulus size for the key ring (`pkiKeyRing.modulus` per APIC MIM). Omit to let APIC use its default."
  type        = string
  default     = null

  validation {
    condition = (
      var.modulus == null || var.modulus == "" ||
      contains(["mod512", "mod1024", "mod2048", "mod3072", "mod4096"], var.modulus)
    )
    error_message = "modulus must be one of: mod512, mod1024, mod2048, mod3072, mod4096."
  }
}
