resource "aws_s3_bucket" "my-bucket" {
  bucket = var.bucketName
}

resource "aws_s3_bucket_acl" "my-bucket" {
  bucket = aws_s3_bucket.my-bucket.id
  acl    = var.aclType
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.my-bucket.id

  policy = <<POLICY
{
"Version": "2012-10-17",
"Statement": [
{
"Sid": "PublicReadGetObject",
"Effect": "Allow",
"Principal": "*",
"Action": "s3:GetObject",
"Resource": "arn:aws:s3:::my-bucket/*"
}
]
}
POLICY
}

resource "aws_s3_object" "index" {
  source = var.index_source
  content_type = var.type_html
  etag = filemd5(var.index_source)
  acl = var.acl_public
  bucket = aws_s3_bucket.my-bucket.bucket
  key    = var.index_file
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.my-bucket.bucket
  key    = var.error_file
  source = var.error_source
  content_type = var.type_html
  etag = filemd5(var.error_source)
  acl = var.acl_public
}


resource "aws_s3_bucket_website_configuration" "my-bucket" {
  bucket = aws_s3_bucket.my-bucket.bucket

  index_document {
    suffix = var.index_file
  }

  error_document {
    key = var.error_file
  }

  routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": ""
    }
}]
EOF
}
