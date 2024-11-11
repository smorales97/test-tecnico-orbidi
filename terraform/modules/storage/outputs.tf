# outputs.tf (storage module)

output "state_bucket_name" {
  description = "El nombre del bucket de S3 utilizado para almacenar el estado de Terraform"
  value       = aws_s3_bucket.terraform_state.bucket
}

output "dynamodb_table_name" {
  description = "El nombre de la tabla de DynamoDB utilizada para el bloqueo del estado de Terraform"
  value       = aws_dynamodb_table.terraform_lock_table.name
}

output "state_bucket_arn" {
  description = "El ARN del bucket de S3 utilizado para almacenar el estado de Terraform"
  value       = aws_s3_bucket.terraform_state.arn
}

output "dynamodb_table_arn" {
  description = "El ARN de la tabla de DynamoDB utilizada para el bloqueo del estado de Terraform"
  value       = aws_dynamodb_table.terraform_lock_table.arn
}
