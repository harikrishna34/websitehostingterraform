resource "aws_cloudfront_distribution" "cloudfront_distribution" {
  origin {
    domain_name = "harishiva11.s3.amazonaws.com"
    origin_id = "S3-harishiva11"
    s3_origin_config {
        origin_access_identity = "origin-access-identity/cloudfront/E19OB9GP68VU5N"
    }
  }
  enabled = true
  default_cache_behavior {
    allowed_methods = [ "DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT" ]
    cached_methods = [ "GET", "HEAD" ]
    target_origin_id = "S3-harishiva11"
    forwarded_values {
      query_string = true
      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "allow-all"
    min_ttl = 0
    default_ttl = 3600
    max_ttl = 86400
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}