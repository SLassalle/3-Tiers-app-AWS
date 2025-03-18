output "rds_security_group_id" {
  value = aws_security_group.rds_sg.id
}

output "bastion_security_group_id" {
  description = "ID du Security Group utilisé pour le Bastion Host"
  value       = aws_security_group.bastion_sg.id
}