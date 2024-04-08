variable "aws_access_key" {
  type = string
  description = "AWS access key"
}
variable "aws_secret_key" {
  type = string
  description = "AWS secret key"
}
variable "aws_region" {
  type = string
  description = "AWS region"
}
variable "bucket_list" {
  type        = list(string)
  default     = ["web-testing-service-storage"]
}
variable role_name_prefix {
  type = string
  default = "web_testing_service"
}