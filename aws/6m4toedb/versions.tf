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
}

provider "aws" {
  alias  = "us_west_1"
  region = "us-west-1"
}

variable "ec2_ami_id" {
  description = "AMI for the test EC2 instances (not captured in the Sedai resource details)."
  type        = string
}
