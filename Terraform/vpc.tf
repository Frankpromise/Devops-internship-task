resource "aws_vpc" "dove_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "vpc_instance"
  }
}

resource "aws_subnet" "public_sub" {
  vpc_id                  = aws_vpc.dove_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.zone1
  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_sub" {
  vpc_id                  = aws_vpc.dove_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = var.zone2
  tags = {
    Name = "private_subnet"

  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.dove_vpc.id
  tags = {
    Name = "ec2_igw"
  }
}

resource "aws_route_table" "dove_pub_rt" {
  vpc_id = aws_vpc.dove_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "access"
  }
}

resource "aws_route_table_association" "assoc" {
  subnet_id      = aws_subnet.public_sub.id
  route_table_id = aws_route_table.dove_pub_rt.id
}