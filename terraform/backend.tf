# backend.tf
terraform {
  backend "s3" {
    bucket         = "state-bucket"
    key            = "terraform/state"
    region         = var.aws_region
    dynamodb_table = "tf-state-lock"
  }
}
