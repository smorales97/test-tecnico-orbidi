# outputs.tf (ECS module)

output "load_balancer_dns_1" {
  description = "El DNS del Application Load Balancer"
  value       = aws_lb.main.dns_name
}

output "simple-app1_service_arn" {
  description = "ARN del servicio de ECS para app1"
  value       = aws_ecs_service.simple-app1
}

output "app2_service_arn" {
  description = "ARN del servicio de ECS para app2"
  value       = aws_ecs_service.simple-app2
}

output "app1_task_definition_arn" {
  description = "ARN de la definición de tarea de ECS para app1"
  value       = aws_ecs_task_definition.simple-app1.arn
}

output "app2_task_definition_arn" {
  description = "ARN de la definición de tarea de ECS para app2"
  value       = aws_ecs_task_definition.simple-app2.arn
}

output "ecs_cluster_id" {
  description = "ID del clúster de ECS"
  value       = aws_ecs_cluster.apps.id
}
