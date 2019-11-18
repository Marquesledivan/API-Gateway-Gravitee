provider "aws" {
  region = "sa-east-1"
}

variable "key" {
  type        = "string"
  default     = "docker.pem"
}
variable "name"		{ default = "Gravitee-Gateway" }
variable "ambiente"	{ default = "PROD" }
variable "plataforma"	{ default = "API Gateway" }
variable "equipe"	{ default = "Hotel Nac" }
variable "bu"		{ default = "Submarino" }
variable "ttl"		{ default = "NA" }
variable "ttlaction"	{ default = "NA" }
variable "aws_region" { default = "sa-east-1" }
variable "vpc" { default = "vpc-06cbca6f901e8429f" }
variable "subnet_priv" { default = "subnet-0f028ce45acd2e6bb" }
variable "subnet_priv2" { default = "subnet-0c64d0c1c807e8d13"}
variable "subnet_pub" { default = "subnet-13a8555a" }
variable "instance_1" { default = "m5.xlarge" }
data "aws_ami" "ec2-linux" {
  most_recent = true
  owners = ["137112412989"]
  filter {
    name   = "name"
    values = ["amzn2-ami-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
}
