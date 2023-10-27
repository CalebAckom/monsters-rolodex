terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
  access_key = "AKIAYQCFSF6RKXDLCKND"
  secret_key = "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"
}
