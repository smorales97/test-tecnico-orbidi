# Bucket de S3 para almacenamiento de estado de Terraform
resource "aws_s3_bucket" "terraform_state" {
  bucket = var.state_bucket_name
  tags = {
    Name = "tf state bucket"
  }
}

# DynamoDB para bloqueo de estado
resource "aws_dynamodb_table" "terraform_lock_table" {
  name         = var.dynamodb_table_name
  billing_mode = var.dynamodb_billing_mode
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform Lock Table"
    dynamodb_table_name = "dynamo-table"
  }
}
