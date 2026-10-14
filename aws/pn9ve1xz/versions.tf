terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Owner                 = "neda@sedai.io"
      FinancialOwner        = "sreejith@sedai.io"
      DeploymentEnvironment = "RnD"
      Environment           = "labs"
      Tenant                = "Sedai"
      CostCenter            = "Tesseract"
      RequestID             = "ID-190"
      Terraform             = "true"
      ExpiryDate            = "2026-11-11"
      ExpiryBypass          = "false"
    }
  }
}
