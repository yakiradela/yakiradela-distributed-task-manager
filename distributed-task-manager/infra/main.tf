module "vpc" {
  source           = "./vpc"
  vpc_name         = var.vpc_name
  vpc_cidr         = var.vpc_cidr
  azs              = var.azs
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  environment      = var.environment
}

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = module.vpc.vpc_id
}

module "eks" {
  source          = "./eks"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  environment     = var.environment
}

module "rds" {
  source            = "./rds"
  db_username       = var.db_username
  db_password       = var.db_password
  private_subnets   = module.vpc.private_subnets
  security_group_id = data.aws_security_group.default.id
}
