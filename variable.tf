variable "region" {
  description = "AWS region"
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket name for Terraform state"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}
// Variable for IAM role name 
variable "role_name" {
  description = "The name of the IAM role"
  default     = "example_role"
}
