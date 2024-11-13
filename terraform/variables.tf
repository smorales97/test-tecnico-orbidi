# variables.tf
variable "AWS_REGION" {
  description = "AWS region"
}

variable "SIMPLE_APP1" {
  description = "Docker image URI for app1"
  type        = string
}

variable "SIMPLE_APP2" {
  description = "Docker image URI for app2"
  type        = string
}

variable "IMAGE_TAG" {
  description = "Docker image tag"
  type        = string
}

variable "AWS_ACCOUNT_ID" {
  description = "AWS account ID"
  type        = string
}