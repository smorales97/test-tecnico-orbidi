output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.main.id
}

output "ecs_security_group_id" {
  description = "ID del grupo de seguridad para ECS"
  value       = aws_security_group.ecs_sg.id
}
