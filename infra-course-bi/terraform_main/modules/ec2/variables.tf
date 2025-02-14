variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "ami" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}
variable "key_name" {
  description = "The name of the SSH key pair"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet ID"
  type        = string
}

variable "eip_allocation_id" {
  description = "Elastic IP Allocation ID"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for EC2 security group"
  type        = string
}

