# ----------------------------------------------------------------------------------------------------------------------
# AWS CREDENTIALS
# ----------------------------------------------------------------------------------------------------------------------

variable "aws_access_key_id" {
  description = "AWS access key credential"
}

variable "aws_secret_access_key" {
  description = "AWS secret access key credential"
}

variable "region" {
  default = "us-west-2"
}

variable "aws_account_id" {
  description = "AWS account id"
}

variable "aws_terraform_user_provider" {
  description = "AWS account used to deploy project"
}

# ----------------------------------------------------------------------------------------------------------------------
# DOMAIN DEFINITIONS
# ----------------------------------------------------------------------------------------------------------------------

variable "domain" {
  default = "kpinetwork.com"
}

locals {
  demo_certs = [
    "${terraform.workspace}.${var.domain}"
  ]
  environment = terraform.workspace
  cert_sans = local.demo_certs
  domains = {
    "root" = var.domain
    "demo" = "demo.${var.domain}"
  }
}

variable "backend" {
  default     = "s3"
}