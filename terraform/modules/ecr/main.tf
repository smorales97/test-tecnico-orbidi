# main.tf (ECR module)

resource "aws_ecr_repository" "app1" {
  name                 = var.simple-app1_image
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "app2" {
  name                 = var.simple-app2_image
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}