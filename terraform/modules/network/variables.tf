variable "vpc_cidr" {
  description = "Rango CIDR para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_blocks" {
  description = "Lista de CIDR blocks para las subredes públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "availability_zones" {
  description = "Lista de zonas de disponibilidad para las subredes públicas"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "allow_http_access" {
  description = "Indica si el grupo de seguridad permite acceso HTTP desde cualquier dirección IP"
  type        = bool
  default     = true
}
