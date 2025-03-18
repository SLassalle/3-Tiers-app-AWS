variable "aws_region" {
  description = "Région AWS pour le déploiement"
  default     = "eu-west-3"
}

variable "vpc_cidr" {
  description = "Plage CIDR du VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Liste des subnets publics"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_app_subnets" {
  description = "Liste des subnets privés pour l'application"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "private_db_subnets" {
  description = "Liste des subnets privés pour la base de données"
  type        = list(string)
  default     = ["10.0.5.0/24", "10.0.6.0/24"]
}

variable "eks_cluster_name" {
  description = "Nom du cluster EKS"
  default     = "devops-cluster"
}

variable "rds_instance_class" {
  description = "Type d’instance RDS"
  default     = "db.t4g.micro"
}

variable "allowed_cidr_blocks" {
  description = "Liste des CIDR autorisées pour accéder aux services internes"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "bastion_instance_type" {
  description = "Type d'instance du Bastion Host"
  type        = string
  default     = "t3.micro"
}

variable "ssh_key_name" {
  description = "Nom de la clé SSH pour se connecter au Bastion"
  type        = string
  default     = "SSH-key"
}

variable "allowed_ips" {
  description = "Liste des IPs autorisées à accéder en SSH au Bastion"
  type        = list(string)
  default     = ["YOUR_IP/32"]
}