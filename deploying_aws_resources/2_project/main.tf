terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_security_group" "app_sg" {
  name        = "app_sg"
  description = "allow on port 8080"

}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.app_sg.id
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
  cidr_ipv4         = "0.0.0.0/0"
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.app_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

data "aws_ami" "app_ami" {
  most_recent = true
  name_regex  = "cocktails-app-*"
  owners      = ["self"]

}
resource "aws_instance" "web_app" {
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.app_ami.id
  vpc_security_group_ids = [aws_security_group.app_sg.id]


}
