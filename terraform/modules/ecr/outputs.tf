# outputs.tf (ECR module)

output "app1_image_url" {
  description = "URL del repositorio de ECR para app1"
  value       = aws_ecr_repository.app1.repository_url
}

output "app2_image_url" {
  description = "URL del repositorio de ECR para app2"
  value       = aws_ecr_repository.app2.repository_url
}
