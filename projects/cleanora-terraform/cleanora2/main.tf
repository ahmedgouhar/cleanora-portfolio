module "s3" {
  source = "../../../ modules/s3"
   cloudfront_arn = module.cloudfront.cdn_arn
  
}


module "cloudfront" {
  source = "../../../ modules/cloudfront"

  s3_domain_name = module.s3.bucket_regional_domain_name
  # acm_certificate_arn = module.acm.certificate_arn
}
# module "acm" {
#   domain_name = "cleanora.com"
#   source = "../../../ modules/acm"
#    zone_id     = module.dns.zone_id

#   providers = {
#     aws = aws.us_east_1
#   }
# }
# module "dns" {
#   source = "../../../ modules/DNS"
#    cloudfront_domain    = module.cloudfront.domain_name_cloud
#   cloudfront_zone_id   = "Z2FDTNDATAQYW2"
#    domain_name = "cleanora.com"
# }