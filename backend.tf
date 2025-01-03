terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket-312025"
    key    = "state-file"
    region = "us-east-1"
  }

}

