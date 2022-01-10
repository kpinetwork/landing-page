output "distribution_id" {
  value = module.cdn.landing_cloudfront_distribution.id
}

output "region" {
  value = var.region
}

output "bucket_name" {
  value = module.buckets.landing_bucket.name
}