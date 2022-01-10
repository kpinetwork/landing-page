# ----------------------------------------------------------------------------------------------------------------------
# CDN INPUTS
# ----------------------------------------------------------------------------------------------------------------------

variable "landing_bucket" {}
variable "domain" {}
variable "sub_domain" {}
variable "certificate_arn" {}
variable "environment" {}
variable "is_production" {}
locals {
  aliases = var.is_production ? [
    var.domain,
    var.sub_domain
  ] : [
    var.sub_domain
  ]
}
