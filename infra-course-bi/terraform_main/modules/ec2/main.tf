resource "aws_instance" "ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.public_subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name      = "bi-${var.environment}-kai-ec2"
    Cost      = "bi_kai"
    Project   = "bi"
    env       = var.environment
    createdBy = "kai"
  }
}

# Elastic IP の関連付け
resource "aws_eip_association" "ec2_eip" {
  instance_id   = aws_instance.ec2.id
  allocation_id = var.eip_allocation_id
}

resource "aws_security_group" "ec2_sg" {
  name        = "bi-${var.environment}-kai-sg"
  description = "Security group for EC2 instance"
  vpc_id      = var.vpc_id  

  # SSH (22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP (80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS (443)
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # 全てのアウトバウンドを許可
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "bi-${var.environment}-kai-sg"
    Cost      = "bi_kai"
    Project   = "bi"
    env       = var.environment
    createdBy = "kai"
  }
}
