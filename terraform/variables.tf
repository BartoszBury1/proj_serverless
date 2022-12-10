variable "bucketName" {
  type    = string
  default = "my-bucket"
}

variable "objectKey" {
  type    = string
  default = "test"
}

variable "aclType" {
  type    = string
  default = "private"
}


variable "indexWebsiteFile" {
  type    = string
  default = "index.html"
}

variable "errorWebsiteFile" {
  type    = string
  default = "error.html"
}

variable "error_source" {
  type = string
  default = "www/error.html"
}
variable "index_source" {
  type = string
  default = "www/index.html"
}

variable "type_html" {
  type = string
  default = "text/html"
}

variable "acl_public" {
  type = string
  default = "public-read"
}


variable "awsSource" {
  type    = string
  default = "hashicorp/aws"
}

variable "awsVersion" {
  type    = string
  default = "~> 3.27"
}

variable "policyDocumentPrincipalsType" {
  type    = string
  default = "AWS"
}

variable "policyDocumentPrincipalsIdentifiers" {
  type    = list(string)
  default = ["123456789012"]
}

variable "policyDocumentPrincipalsActions" {
  type    = list(string)
  default = [
    "s3:GetObject",
    "s3:ListBucket",
  ]
}
