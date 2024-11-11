# backend.tf
terraform {
  backend "s3" {
    bucket         = "state-bucket"
    key            = "terraform/state"
    region         = "us-east-1"
    dynamodb_table = "tf-state-lock"
  }
}
