terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "CandyDevNetwork"
  region  = "ca-central-1"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-0d833a36f4aa82e6b"
  instance_type          = "t3.large"
  vpc_security_group_ids = ["sg-04ba791c39ddb8d52"]
  subnet_id              = "subnet-0d4b6d25ebd3bb0e1"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

