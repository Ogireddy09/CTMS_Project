# provider details
provider "aws" {
  region = var.region
}
# Create the IAM role
resource "aws_iam_role" "example_role" {
  name               = "example_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}
# Define the assume role policy document
data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}
# Create the IAM policy
resource "aws_iam_policy" "example_policy" {
  name   = "example_policy"
  policy = data.aws_iam_policy_document.example_policy.json
}
# Define the policy document
data "aws_iam_policy_document" "example_policy" {
  statement {
    actions   = ["s3:ListBucket"]
    resources = ["arn:aws:s3:::example_bucket"]
  }
}
# Attach the policy to the role
resource "aws_iam_role_policy_attachment" "example_policy_attach" {
  role       = aws_iam_role.example_role.name
  policy_arn = aws_iam_policy.example_policy.arn
}
