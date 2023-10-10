resource "aws_s3_bucket" "api_staging" {
  bucket = var.api_staging_bucket
  acl    = "private"

  versioning {
    enabled = false
  }

  tags = var.tags
}

resource "aws_s3_bucket" "api_terraform_state" {
  bucket = var.api_terraform_state
  acl    = "private"

  versioning {
    enabled = false
  }

  tags = var.tags
}
