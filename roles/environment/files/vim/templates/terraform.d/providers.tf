###############################################################################
# Terraform and Providers
#

## Terraform ==================================================================
terraform {
  required_version = "~> 1.6"

  required_providers {
    /*
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.8.0"
    }
    */
  }

  /*
  backend "s3" {
    bucket  = ""
    key     = ""
    region  = ""
    encrypt = true
  }
  */
}

## Providers ==================================================================
