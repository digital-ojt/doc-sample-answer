resource "aws_rds_cluster" "aurora" {
  cluster_identifier              = "bi-${var.environment}-kai-rds-cluster"
  engine                          = "aurora-mysql"
  engine_version                  = "8.0.mysql_aurora.3.04.0"
  database_name                   = var.database_name
  master_username                 = var.master_username
  master_password                 = var.master_password
  backup_retention_period         = 7
  preferred_backup_window         = "07:00-09:00"
  db_subnet_group_name            = aws_db_subnet_group.aurora_subnet_group.name 
  vpc_security_group_ids          = [aws_security_group.aurora_sg.id]
  apply_immediately               = true
  db_cluster_parameter_group_name = var.db_cluster_parameter_group_name
  skip_final_snapshot = true

  tags = {
    Name        = "bi-${var.environment}-kai-rds-cluster"
    Project     = var.project
    environment = var.environment
    Cost        = var.cost
  }
}

resource "aws_rds_cluster_instance" "aurora_instance" {
  count                    = 1
  identifier               = "bi-${var.environment}-kai-rds-instance-${count.index}"
  cluster_identifier       = aws_rds_cluster.aurora.id
  instance_class           = "db.t3.medium"
  engine                   = "aurora-mysql"
  engine_version           = "8.0.mysql_aurora.3.04.0"
  db_subnet_group_name     = aws_db_subnet_group.aurora_subnet_group.name 
  db_parameter_group_name  = var.db_instance_parameter_group_name
  apply_immediately        = true
  publicly_accessible      = false

  tags = {
    Name        = "bi-${var.environment}-kai-rds-instance-${count.index}"
    Project     = var.project
    environment = var.environment
    Cost        = var.cost
  }
}

resource "aws_security_group" "aurora_sg" {
  name        = "bi-${var.environment}-kai-rds-sg"
  description = "Security group for Aurora RDS"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.ec2_security_group_id] # EC2のSGのみ許可
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # すべてのプロトコル
    cidr_blocks = ["0.0.0.0/0"]  # すべての外部ネットワークにアクセス可能
  }

  tags = {
    Name        = "bi-${var.environment}-kai-rds-sg"
    Project     = var.project
    environment = var.environment
    Cost        = var.cost
  }
}

resource "aws_db_subnet_group" "aurora_subnet_group" {
  name        = "bi-${var.environment}-kai-aurora-subnet-group"
  subnet_ids  = [var.private_subnet1_id, var.private_subnet2_id]  
  description = "Subnet group for Aurora RDS"

  tags = {
    Name        = "bi-${var.environment}-kai-aurora-subnet-group"
    Project     = var.project
    environment = var.environment
    Cost        = var.cost
  }
}

