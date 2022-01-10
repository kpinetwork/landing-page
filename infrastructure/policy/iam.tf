# ----------------------------------------------------------------------------------------------------------------------
# S3 IAM POLICY
# Provides an IAM role.
# https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html
# ----------------------------------------------------------------------------------------------------------------------

data "aws_iam_policy_document" "landing_distribution_bucket" {
  statement {
    actions = [
      "s3:GetObject"]
    principals {
      type = "AWS"
      identifiers = [
        var.cloudfront_distribution_oai_iam_arn
      ]
    }
    resources = [
      "${var.landing_bucket.arn}/*"]
  }
  statement {
    actions = [
      "s3:ListBucket"]
    resources = [
      var.landing_bucket.arn]

    principals {
      type = "AWS"
      identifiers = [
        var.cloudfront_distribution_oai_iam_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "landing_web_distribution" {
  bucket = var.landing_bucket.id
  policy = data.aws_iam_policy_document.landing_distribution_bucket.json
}


resource "aws_s3_bucket_public_access_block" "landing_bucket_restriction" {
  bucket = var.landing_bucket.id

  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
  depends_on = [
    aws_s3_bucket_policy.landing_web_distribution
  ]
}