variable "vpc_id" {
  description = "ID du VPC dans lequel sera déployé RDS"
  type        = string
}

variable "subnet_ids" {
  description = "Liste des subnets privés pour RDS"
  type        = list(string)
}

variable "instance_class" {
  description = "Type d’instance RDS"
  type        = string
}

variable "rds_security_group_id" {
  description = "ID du Security Group pour RDS"
  type        = string
}

variable "db_password" {
  description = "Mot de passe de la base de données"
  type        = string
  sensitive   = true
}
