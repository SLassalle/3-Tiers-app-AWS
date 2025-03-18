variable "vpc_cidr" {
  description = "CIDR du VPC"
  type        = string
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