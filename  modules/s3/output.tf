# output "website_endpoint" {
#   value = aws_s3_bucket.cleanora_bucket.website_endpoint
# }

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.cleanora_bucket.bucket_regional_domain_name
}