resource "aws_instance" "bastion" {
  ami                         = "ami-0c55b159cbfafe1f0" # 🔥 Ubuntu 22.04 LTS (AMI à mettre à jour selon la région)
  instance_type               = var.bastion_instance_type
  key_name                    = var.ssh_key_name
  vpc_security_group_ids      = [var.bastion_security_group_id] # ✅ Utilisation de la variable ici
  subnet_id                   = element(var.public_subnets, 0)
  associate_public_ip_address = true

  tags = {
    Name = "Bastion Host"
  }
}