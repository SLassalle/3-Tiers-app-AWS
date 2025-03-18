output "bastion_ip" {
  description = "Adresse IP publique du Bastion Host"
  value       = aws_instance.bastion.public_ip
}