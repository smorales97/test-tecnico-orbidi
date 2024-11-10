########################################################################################################################################
                                                            # ECS MODULE
########################################################################################################################################

resource "aws_ecs_cluster" "apps" {
  name = "apps-cluster"
}

resource "aws_lb" "main" {
  name               = "ecs-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.ecs_sg]
  subnets            = var.public_subnets
}

resource "aws_lb_target_group" "simple-app1" {
  port     = 8000
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_ecs_task_definition" "simple-app1" {
  family                   = "simple-app1-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  memory                   = "512"
  cpu                      = "256"

  container_definitions = jsonencode([
    {
      name      = "simple-app1-container"
      image     = var.app1_image_url
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 8000
          hostPort      = 8000
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "simple-app1" {
  name            = "app1-service"
  cluster         = aws_ecs_cluster.apps.id
  task_definition = aws_ecs_task_definition.simple-app1.arn
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.public_subnets
    security_groups = [var.ecs_sg]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.simple-app1.arn
    container_name   = "simple-app1-container"
    container_port   = 8000
  }

  desired_count = 1
}

resource "aws_lb_target_group" "simple-app2" {
  port     = 8001
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_ecs_task_definition" "simple-app2" {
  family                   = "simple-app2-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  memory                   = "512"
  cpu                      = "256"

  container_definitions = jsonencode([
    {
      name      = "simple-app2-container"
      image     = var.app2_image_url
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 8001
          hostPort      = 8001
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "simple-app2" {
  name            = "app2-service"
  cluster         = aws_ecs_cluster.apps.id
  task_definition = aws_ecs_task_definition.simple-app2.arn
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.public_subnets
    security_groups = [var.ecs_sg]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.simple-app2.arn
    container_name   = "simple-app2-container"
    container_port   = 8001
  }

  desired_count = 1
}

output "load_balancer_dns" {
  value = aws_lb.main.dns_name
}
