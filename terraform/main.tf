# main.tf
provider "aws" {
  region = var.AWS_REGION
}

# Módulo de red
module "network" {
  source = "./modules/network"
}

# Módulo de ECS
module "ecs" {
  source          = "./modules/ecs"
  ecs_sg          = module.network.ecs_security_group_id
  vpc_id          = module.network.vpc_id
  public_subnets  = module.network.public_subnet_ids
  AWS_ACCOUNT_ID  = var.AWS_ACCOUNT_ID
  AWS_REGION      = var.AWS_REGION
  SIMPLE_APP1     = var.SIMPLE_APP1
  SIMPLE_APP2     = var.SIMPLE_APP2
  IMAGE_TAG       = var.IMAGE_TAG
}