provider "aws" {
  region = var.aws_region
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  token                  = module.eks.cluster_token
  cluster_ca_certificate = module.eks.cluster_ca_cert
}