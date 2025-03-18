variable "vpc_id" {
  description = "ID du VPC où sera déployé le Bastion Host"
  type        = string
}

variable "public_subnets" {
  description = "Liste des subnets publics où déployer le Bastion"
  type        = list(string)
}

variable "bastion_instance_type" {
  description = "Type d'instance pour le Bastion Host"
  type        = string
  default     = "t3.micro"
}

variable "ssh_key_name" {
  description = "Nom de la clé SSH pour accéder au Bastion"
  type        = string
}

variable "bastion_security_group_id" {
  description = "ID du Security Group utilisé par le Bastion"
  type        = string
}