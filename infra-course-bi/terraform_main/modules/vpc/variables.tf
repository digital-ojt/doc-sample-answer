variable "environment" {
  description = "Deployment environment (dev/prod)"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-northeast-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet1_cidr" {
  description = "CIDR block for the first private subnet (Aurora)"
  type        = string
}

variable "private_subnet2_cidr" {
  description = "CIDR block for the second private subnet (Aurora)"
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
