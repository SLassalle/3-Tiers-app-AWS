variable "vpc_id" {
  description = "ID du VPC dans lequel configurer l'Internet Gateway et NAT"
  type        = string
}

variable "public_subnets" {
  description = "Liste des subnets publics où attacher les NAT Gateways"
  type        = list(string)
}
