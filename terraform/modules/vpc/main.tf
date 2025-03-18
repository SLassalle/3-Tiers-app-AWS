# Création du VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true # Active la résolution DNS pour les instances EC2
  enable_dns_hostnames = true # Permet aux instances d'avoir des noms DNS internes

  tags = {
    Name = "wordpress-vpc"
  }
}

resource "aws_subnet" "public" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnets[count.index]
  availability_zone       = element(["eu-west-3a", "eu-west-3b"], count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet ${count.index + 1}"
  }
}

resource "aws_subnet" "private_app" {
  count             = length(var.private_app_subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_app_subnets[count.index]
  availability_zone = element(["eu-west-3a", "eu-west-3b"], count.index)

  tags = {
    Name = "Private App Subnet ${count.index + 1}"
  }
}

resource "aws_subnet" "private_db" {
  count             = length(var.private_db_subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_db_subnets[count.index]
  availability_zone = element(["eu-west-3a", "eu-west-3b"], count.index)

  tags = {
    Name = "Private DB Subnet ${count.index + 1}"
  }
}