resource "aws_iam_policy" "s3_upload_policy" {
  name        = "S3UploadPolicy"
  description = "Policy for uploading files to S3"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket",
          "s3:DeleteObject"
        ],
        Resource = [
          "${aws_s3_bucket.api_staging.arn}/*"
        ]
      }
    ]
  })
}