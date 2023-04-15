terraform {
  backend "s3" {
    region         = ""
    profile        = ""
    bucket         = "eksa-tfstate-file"              #change me
    key            = "eksa-blog-demo-terraform.state" #change me
    dynamodb_table = "eksa-terraform-state-lock"      #change me
  }
}

provider "aws" {
  profile = var.role
  region  = var.region
}

provider "kubernetes" {
  host                   = format("https://%s:6443", var.mgmt_cluster_ip)
  client_certificate     = data.aws_secretsmanager_secret_version.client_cert.secret_string
  client_key             = data.aws_secretsmanager_secret_version.client_key.secret_string
  cluster_ca_certificate = data.aws_secretsmanager_secret_version.cluster_ca_cert.secret_string
}



