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
variable "policy_name" {
  description = "Name of the IAM policy" 
  type = string 
}

