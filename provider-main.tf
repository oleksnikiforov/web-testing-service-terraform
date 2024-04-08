terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.13.0"
    }
  }
}
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

resource "aws_s3_bucket" "web_testing_service_buckets" {
  count = length(var.bucket_list)

  bucket = var.bucket_list[count.index]

  acl = "private"  # You can adjust the ACL as needed
}


resource "aws_iam_user_policy_attachment" "s3_read_only_policy_attachment" {
  count = length(var.bucket_list)
  policy_arn = aws_iam_policy.s3_full_access_policy[count.index].arn
  user      =  aws_iam_user.web_testing_service_user.name
}