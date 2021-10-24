provider "aws" {
  region = "us-west-2"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "pradipta-s3-tfstate"
    key    = "platform.tfstate"
    region = "us-west-2"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "ubuntu" {
  ami           = "ami-03d5c68bab01f3496"
  instance_type = "t2.micro"
}
