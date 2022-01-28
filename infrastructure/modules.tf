module "buckets" {
  source = "./buckets/"
  environment = local.environment
}

module "cdn" {
  source = "./cdn/"
  sub_domain = local.domains[local.environment]
  certificate_arn = module.cert.certificate_validation_arn
  landing_bucket = module.buckets.landing_bucket
}

module "policy" {
  source = "./policy/"
  landing_bucket = module.buckets.landing_bucket
  aws_terraform_user_provider = var.aws_terraform_user_provider
  aws_account_id = var.aws_account_id
  cloudfront_distribution_oai_iam_arn = module.cdn.landing_cloudfront_distribution_oai
}

module "dns" {
  source = "./dns"
  aws_cloudfront_distribution = module.cdn.landing_cloudfront_distribution
  sub_domain = local.domains[local.environment]
  domain_certificates = module.cert.domain_certificate
  cert_sans = local.cert_sans
  hosted_zone_id = aws_route53_zone.kpinetwork.zone_id
}

module "cert" {
  source = "./certificates"
  cert_validation_fqdn = module.dns.landing_cert_validation_fqdn
  domain_name = local.domains[local.environment]
  aws_access_key_id = var.aws_access_key_id
  aws_secret_access_key = var.aws_secret_access_key
  cert_sans = local.cert_sans
}