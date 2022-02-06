resource "aws_s3_bucket" "mybucket" {
  bucket = "harishiva11"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
  website {
    index_document="index.html"
  }
}
 #upload single object 

 resource "aws_s3_bucket_object" "s3singleobject" {
  bucket = aws_s3_bucket.mybucket.id
  key    = "index.html"
  acl    = "public-read"  # or can be "public-read"
  source = "C:/Users/Hari/Desktop/terraform/s3/index.html"
  etag = filemd5("C:/Users/Hari/Desktop/terraform/s3/index.html")
  content_type = "text/html"
}