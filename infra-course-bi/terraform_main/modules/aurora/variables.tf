variable "environment" {
  description = "Deployment environment (dev/prod)"
  type        = string
}

variable "database_name" {
  description = "Aurora database name"
  type        = string
  default     = "bi_aurora_db"
}

variable "master_username" {
  description = "Master username for Aurora"
  type        = string
  default     = "admin"
}

variable "master_password" {
  description = "Master password for Aurora"
  type        = string
}

variable "db_subnet_group_name" {
  description = "Existing DB subnet group"
  type        = string
}

variable "db_cluster_parameter_group_name" {
  description = "Existing DB cluster parameter group"
  type        = string
}

variable "db_instance_parameter_group_name" {
  description = "Existing DB instance parameter group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for Aurora"
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

variable "private_subnet1_id" {
  description = "Private Subnet 1 ID"
  type        = string
}

variable "private_subnet2_id" {
  description = "Private Subnet 2 ID"
  type        = string
}

variable "ec2_security_group_id" {
  description = "Security Group ID of the EC2 instance"
  type        = string
}
