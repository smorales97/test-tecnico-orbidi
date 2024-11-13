# backend.tf
terraform {
  backend "s3" {
    bucket         = "tf-s3-state-orbidi-sanmoral"
    key            = "test-ecs-developoment/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}


