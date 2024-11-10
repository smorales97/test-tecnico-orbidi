# variables.tf (ECR module)

variable "simple-app1_image" {
  description = "Nombre del repositorio de ECR para la imagen de app1"
  type        = string
  default     = "simple-app1"
}

variable "simple-app2_image" {
  description = "Nombre del repositorio de ECR para la imagen de app2"
  type        = string
  default     = "simple-app2"
}

variable "aws_region" {
  description = "La región de AWS en la que se crean los repositorios de ECR"
  type        = string
  default     = "us-east-1"
}
