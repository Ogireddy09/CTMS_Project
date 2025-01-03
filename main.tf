# provider details
provider "aws" {
  region = var.region
}
#Define the policy document
data "aws_iam_policy_document" "ctms_test_policy_doc" {
  statement {
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = ["arn:aws:s3:::${var.bucket_name}"]

  }
}
# Create the IAM role
resource "aws_iam_role" "ctms_test_role" {
  name               = "var.role_name"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}
# Create the IAM policy
resource "aws_iam_policy" "ctms_test_policy" {
  name   = "ctms_test_policy"
  policy = data.aws_iam_policy_document.ctms_test_policy_doc.json
}

# Define the assume role policy document
data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    # Specify the principal (e.g., AWS account, IAM user, etc.) that can assume the role
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}
# Attach the policy to the role
resource "aws_iam_role_policy_attachment" "ctms_test_policy_attach" {
  role       = aws_iam_role.ctms_test_role.name
  policy_arn = aws_iam_policy.ctms_test_policy.arn
}


