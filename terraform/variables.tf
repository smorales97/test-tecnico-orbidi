# variables.tf
variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "simple-app1" {
  description = "Docker image URI for app1"
  type        = string
}

variable "simple-app2" {
  description = "Docker image URI for app2"
  type        = string
}

variable "state_bucket_name" {
  description = "Bucket name"
  type        = string
}

variable "dynamodb_table" {
  description = "Dynamo table lock id"
  type        = string

}