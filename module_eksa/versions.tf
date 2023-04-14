terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.18.1"
    }
  }
  required_version = ">= 1.2.0"
}
