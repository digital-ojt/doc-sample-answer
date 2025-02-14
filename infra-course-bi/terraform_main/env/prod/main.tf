module "vpc" {
  source               = "../../modules/vpc"
  environment          = var.environment
  aws_region           = var.aws_region
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet1_cidr = var.private_subnet1_cidr
  private_subnet2_cidr = var.private_subnet2_cidr
}

module "ec2" {
  source              = "../../modules/ec2"
  environment         = var.environment
  vpc_id             = module.vpc.vpc_id
  public_subnet_id   = module.vpc.public_subnet_id
  ami                = var.ami
  instance_type      = var.instance_type
  key_name           = var.key_name
  eip_allocation_id  = var.eip_allocation_id
}

module "aurora" {
  source                          = "../../modules/aurora"
  environment                     = var.environment
  vpc_id                          = module.vpc.vpc_id
  private_subnet1_id              = module.vpc.private_subnet1_id  
  private_subnet2_id              = module.vpc.private_subnet2_id  
  db_subnet_group_name            = "bi-prod-kai-aurora-subnet-group"
  db_cluster_parameter_group_name = "bi-prod-kai-rds-cluster-pg"
  db_instance_parameter_group_name = "bi-prod-kai-rds-instance-pg"
  database_name                   = "bi_aurora_db"
  master_username                 = "admin"
  master_password                 = "YourSecurePassword123!"
  ec2_security_group_id           = module.ec2.ec2_security_group_id
  cost = var.cost
}