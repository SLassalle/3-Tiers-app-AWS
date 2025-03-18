terraform {
  backend "s3" {
    bucket       = "devops-project-sla-terraform-state"
    key          = "state/terraform.tfstate"
    region       = "eu-west-3"
    use_lockfile = true
    encrypt      = true
  }
}