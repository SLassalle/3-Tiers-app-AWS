variable "vpc_id" {
  description = "ID du VPC où seront créés les Security Groups"
  type        = string
}

variable "allowed_cidr_blocks" {
  description = "Liste des CIDR autorisées pour accéder à RDS"
  type        = list(string)
  default     = ["10.0.0.0/16"] # Par défaut, accès seulement au réseau privé
}

variable "allowed_ips" {
  description = "Liste des IPs autorisées à se connecter en SSH au Bastion"
  type        = list(string)
}