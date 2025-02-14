resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "bi-${var.environment}-kai-vpc"
    Project     = var.project
    environment = var.environment
    Cost        = var.cost
  }
}

# インターネットゲートウェイ
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "bi-${var.environment}-kai-igw"
    Project     = var.project
    environment = var.environment
    Cost        = var.cost
  }
}

# パブリックサブネット
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}a"

  tags = {
    Name        = "bi-${var.environment}-kai-public-subnet"
    Project     = var.project
    environment = var.environment
    Cost        = var.cost
  }
}

# パブリックサブネット向けのルートテーブル
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "bi-${var.environment}-kai-public-rt"
    Project     = var.project
    environment = var.environment
    Cost        = var.cost
  }
}

# デフォルトルート
resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

# パブリックサブネットをルートテーブルに関連付け
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public.id
}

# プライベートサブネット
resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet1_cidr
  availability_zone = "${var.aws_region}a"

  tags = {
    Name        = "bi-${var.environment}-kai-private-subnet1"
    Project     = var.project
    environment = var.environment
    Cost        = var.cost
  }
}

# プライベートサブネット
resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet2_cidr
  availability_zone = "${var.aws_region}c"

  tags = {
    Name        = "bi-${var.environment}-kai-private-subnet2"
    Project     = var.project
    environment = var.environment
    Cost        = var.cost
  }
}
