# variables.tf (storage module)

variable "state_bucket_name" {
  description = "Nombre del bucket de S3 para almacenar el estado de Terraform"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Nombre de la tabla DynamoDB para el bloqueo de estado de Terraform"
  type        = string
}

variable "aws_region" {
  description = "La región de AWS donde se crearán el bucket de S3 y la tabla de DynamoDB"
  type        = string
  default     = "us-east-1"
}

variable "versioning_enabled" {
  description = "Habilita la versioning en el bucket de S3 para el almacenamiento de estado"
  type        = bool
  default     = true
}

variable "dynamodb_billing_mode" {
  description = "Modo de facturación para la tabla DynamoDB (PAY_PER_REQUEST o PROVISIONED)"
  type        = string
  default     = "PAY_PER_REQUEST"
}
