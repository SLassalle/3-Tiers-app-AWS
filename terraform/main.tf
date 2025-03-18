module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  public_subnets      = var.public_subnets
  private_app_subnets = var.private_app_subnets
  private_db_subnets  = var.private_db_subnets
}

module "networking" {
  source         = "./modules/networking"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
}

module "bastion" {
  source                    = "./modules/bastion"
  vpc_id                    = module.vpc.vpc_id
  public_subnets            = module.vpc.public_subnets
  bastion_instance_type     = var.bastion_instance_type
  ssh_key_name              = var.ssh_key_name
  bastion_security_group_id = module.security.bastion_security_group_id # ✅ On récupère l'ID du SG ici
}

module "security" {
  source              = "./modules/security"
  vpc_id              = module.vpc.vpc_id
  allowed_cidr_blocks = var.allowed_cidr_blocks
  allowed_ips         = var.allowed_ips
}

module "eks" {
  source       = "./modules/eks"
  cluster_name = var.eks_cluster_name
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.private_app_subnets
}

module "rds" {
  source                = "./modules/rds"
  instance_class        = var.rds_instance_class
  vpc_id                = module.vpc.vpc_id
  subnet_ids            = module.vpc.private_db_subnets
  rds_security_group_id = module.security.rds_security_group_id
  db_password           = "SuperSecurePassword!"
}