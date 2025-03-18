resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "RDS Subnet Group"
  }
}

resource "aws_db_instance" "database" {
  allocated_storage       = 20
  engine                  = "mysql"
  instance_class          = var.instance_class
  username                = "admin"
  password                = "SuperSecurePassword!"
  vpc_security_group_ids  = [var.rds_security_group_id]
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  multi_az                = true
  publicly_accessible     = false
  deletion_protection     = false # Pas une bonne pratique mais pour pouvoir destroy facilement sinon : True = Empêche la suppression accidentelle
  backup_retention_period = 7     # Sauvegardes automatiques sur 7 jours
  skip_final_snapshot     = true  # Pas une bonne pratique mais pour pouvoir destroy facilement sans frais supplémentaires : false = Créé un snapshot de la BDD avant suppression
  #final_snapshot_identifier = "mon-snapshot-final"

  tags = {
    Name = "DevOps DB"
  }
}