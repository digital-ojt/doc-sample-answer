variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-northeast-1"
}

variable "environment" {
  description = "Environment name (dev or prod)"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "bi"
}

variable "cost" {
  description = "Cost center"
  type        = string
  default     = "bi_kai"
}

# VPC関連（module.vpc の output を参照）
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.2.0/26"
}

variable "private_subnet1_cidr" {
  description = "CIDR block for the first private subnet (Aurora)"
  type        = string
  default     = "10.0.2.64/26"
}

variable "private_subnet2_cidr" {
  description = "CIDR block for the second private subnet (Aurora)"
  type        = string
  default     = "10.0.2.128/26"
}

# EC2関連
variable "ami" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "EC2 Key Pair Name"
  type        = string
}

variable "eip_allocation_id" {
  description = "Elastic IP allocation ID for EC2"
  type        = string
}

