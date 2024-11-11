# main.tf
provider "aws" {
  region = var.aws_region
}

# Módulo de red
module "network" {
  source = "./modules/network"
}

# Módulo de ECR
module "ecr" {
  source = "./modules/ecr"
  simple-app1-image = var.simple-app1
  simple-app2-image = var.simple-app2
}

# Módulo de ECS
module "ecs" {
  source          = "./modules/ecs"
  ecs_sg          = module.network.ecs_security_group_id
  vpc_id          = module.network.vpc_id
  public_subnets  = module.network.public_subnet_ids
  app1_image_url  = module.ecr.app1_image_url
  app2_image_url  = module.ecr.app2_image_url
}

# Módulo de almacenamiento para el estado
module "storage" {
  source = "./modules/storage"
  state_bucket_name = var.state_bucket_name
  dynamodb_table_name = var.dynamodb_table
}
