# variables.tf (ECS module)

variable "vpc_id" {
  description = "ID de la VPC en la que se desplegará ECS"
  type        = string
}

variable "public_subnets" {
  description = "Lista de subnets públicas donde se desplegarán las tareas de ECS"
  type        = list(string)
}

variable "ecs_sg" {
  description = "ID del Security Group que permitirá el tráfico al ECS y al ALB"
  type        = string
}

variable "app1_cpu" {
  description = "Cantidad de CPU asignada a la tarea de app1"
  type        = number
  default     = 256
}

variable "app1_memory" {
  description = "Cantidad de memoria asignada a la tarea de app1"
  type        = number
  default     = 512
}

variable "app1_desired_count" {
  description = "Número deseado de instancias de la tarea de app1"
  type        = number
  default     = 1
}

variable "app2_cpu" {
  description = "Cantidad de CPU asignada a la tarea de app2"
  type        = number
  default     = 256
}

variable "app2_memory" {
  description = "Cantidad de memoria asignada a la tarea de app2"
  type        = number
  default     = 512
}

variable "app2_desired_count" {
  description = "Número deseado de instancias de la tarea de app2"
  type        = number
  default     = 1
}

variable "AWS_ACCOUNT_ID" {
  description = "ID de la cuenta AWS"
  type        = string
}

variable "AWS_REGION" {
  description = "La región de AWS en la que se crean los repositorios de ECR"
  type        = string
}

variable "IMAGE_TAG" {
  description = "Etiqueta de la imagen de Docker"
  type        = string
}

variable "SIMPLE_APP1" {
  description = "El nombre del repositorio de ECR para app1"
  type        = string
}

variable "SIMPLE_APP2" {
  description = "El nombre del repositorio de ECR para app2"
  type        = string
}