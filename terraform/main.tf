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
  app1_image = var.simple-app1
  app2_image = var.simple-app2
}

# Módulo de ECS
module "ecs" {
  source          = "./modules/ecs"
  vpc_id          = module.network.vpc_id
  public_subnets  = module.network.public_subnets
  app1_image_url  = module.ecr.app1_image_url
  app2_image_url  = module.ecr.app2_image_url
}

# Módulo de almacenamiento para el estado
module "storage" {
  source = "./modules/storage"
}
