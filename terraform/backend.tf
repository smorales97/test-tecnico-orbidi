# backend.tf
terraform {
  backend "s3" {
    bucket         = "tf-s3-state-orbidi-smorales"
    key            = "terraform/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "app-state-lock"
  }
}


