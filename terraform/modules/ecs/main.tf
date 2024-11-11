########################################################################################################################################
                                                            # ECS MODULE
########################################################################################################################################

resource "aws_ecs_cluster" "apps" {
  name = "apps-cluster"

  depends_on = [aws_lb_listener.apps_listener]
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "ecs_task_execution_role_attachment" {
  name       = "ecsTaskExecutionRolePolicyAttachment"
  roles      = [aws_iam_role.ecs_task_execution_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_lb" "main" {
  name               = "ecs-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.ecs_sg]
  subnets            = var.public_subnets
}

##############################################################################################
                                            #App1
##############################################################################################

# Listener para el Load Balancer
resource "aws_lb_listener" "apps_listener" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.simple-app1.arn
  }
  depends_on = [ aws_lb.main ]
}

resource "aws_lb_listener_rule" "simple-app1_rule" {
  listener_arn = aws_lb_listener.apps_listener.arn
  priority     = 20

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.simple-app1.arn
  }

  condition {
    path_pattern {
      values = ["/app1/*"]
    }
  }
}

resource "aws_lb_listener_rule" "simple-app2_rule" {
  listener_arn = aws_lb_listener.apps_listener.arn
  priority     = 2

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.simple-app2.arn
  }

  condition {
    path_pattern {
      values = ["/app2/*"]
    }
  }
}

resource "aws_lb_target_group" "simple-app1" {
  port     = 8000
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "ip"

health_check {
  path                = "/"
  interval            = 30
  timeout             = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2
  }
}

resource "aws_ecs_task_definition" "simple-app1" {
  family                   = "simple-app1-task"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  memory                   = "512"
  cpu                      = "256"

  container_definitions = jsonencode([
    {
      name      = "simple-App1-Container"
      image     = "${var.app1_image_url}:latest:latest"
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
    container_name   = "simple-App1-Container"
    container_port   = 8000
  }

  desired_count = 1
}

##############################################################################################
                                            #App2
##############################################################################################


resource "aws_lb_target_group" "simple-app2" {
  port     = 8001
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "ip"

  health_check {
  path                = "/"
  interval            = 30
  timeout             = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2
  }
}

resource "aws_ecs_task_definition" "simple-app2" {
  family                   = "simple-app2-task"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  memory                   = "512"
  cpu                      = "256"

  container_definitions = jsonencode([
    {
      name      = "simple-App2-Container"
      image     = "${var.app2_image_url}:latest:latest"
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
    container_name   = "simple-App2-Container"
    container_port   = 8001
  }

  desired_count = 1
}

output "load_balancer_dns" {
  value = aws_lb.main.dns_name
}
