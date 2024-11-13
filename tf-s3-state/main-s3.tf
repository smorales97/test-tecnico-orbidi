provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "tf-s3-state-orbidi-sanmoral"
  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "app-state-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}