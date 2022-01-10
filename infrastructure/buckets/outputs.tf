output "landing_bucket" {
  value = {
    bucket_regional_domain_name : aws_s3_bucket.landing_bucket.bucket_regional_domain_name
    bucket : aws_s3_bucket.landing_bucket.bucket
    name : "${var.environment}-${var.bucket_name}-page"
    id: aws_s3_bucket.landing_bucket.id
    website_endpoint: aws_s3_bucket.landing_bucket.website_endpoint
    arn: aws_s3_bucket.landing_bucket.arn
  }
}
