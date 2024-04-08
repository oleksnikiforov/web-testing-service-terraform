resource "aws_iam_policy" "s3_full_access_policy" {
  count  = length(var.bucket_list)
  name_prefix = "${var.role_name_prefix}-full-access"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket",
          "s3:ListBucketMultipartUploads",
          "s3:ListMultipartUploadParts",
          "s3:AbortMultipartUpload"
        ],
        Resource =  "arn:aws:s3:::${var.bucket_list[count.index]}/*"
      }
    ]
  })
}
