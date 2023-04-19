# Define provider configuration
provider "aws" {
  region = "ap-southeast-2"
}


# Define CloudFront distribution
resource "aws_cloudfront_distribution" "example" {
  origin {
    domain_name = var.S3Bucket_Domain_Name
    origin_id   = var.S3Bucket_id
  }

  aliases = ["*.vmware.education"]

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Voting App Distribution"
  default_root_object = "index.html"
  

  # ACM certificate for HTTPS
  viewer_certificate {
    acm_certificate_arn = var.acm_cert_arn
    ssl_support_method  = "sni-only"
  }

  # Default Cache Behavior
  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.S3Bucket_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  # Price Class
  price_class = "PriceClass_200"

  # Restrictions
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.example.domain_name
}