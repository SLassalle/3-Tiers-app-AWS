variable "cluster_name" {
  description = "Nom du cluster EKS"
}

variable "subnet_ids" {
  description = "Liste des subnets"
}

variable "vpc_id" {
  description = "ID du VPC où sera déployé EKS"
  type        = string
}
