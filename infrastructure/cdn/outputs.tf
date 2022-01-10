output "landing_cloudfront_distribution" {
  value = {
    id: aws_cloudfront_distribution.landing_distribution.id
    domain_name: aws_cloudfront_distribution.landing_distribution.domain_name
    hosted_zone_id: aws_cloudfront_distribution.landing_distribution.hosted_zone_id
  }
}

output "landing_cloudfront_distribution_oai" {
  value = aws_cloudfront_origin_access_identity.landing_web_distribution.iam_arn
}
