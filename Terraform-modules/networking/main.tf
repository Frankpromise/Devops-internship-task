#--networking/main.tf---

# created a random resource to assign numbers to my vpc



# create the vpc


#data "aws_availability_zones" "available" {}


resource "aws_vpc" "mtc_vpc" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        name = "vpc_new"
    }
    lifecycle {
        create_before_destroy = true
    }
}

# create a public subnet to host one instance
resource "aws_subnet" "public_sub" {
    cidr_block = var.public_cidrs
    vpc_id = aws_vpc.mtc_vpc.id
    map_public_ip_on_launch = true
    availability_zone = "us-east-1b"
    tags = {
        Name = "vpc_public"
    }
}

resource "aws_subnet" "private_sub" {
    
    vpc_id = aws_vpc.mtc_vpc.id
    cidr_block = var.private_cidr
    availability_zone = "us-east-1a"
    tags = {
        Name = "vpc_private"
    }
}


# internet gateway

resource "aws_internet_gateway" "mtc_internet_gateway" {
    vpc_id = aws_vpc.mtc_vpc.id
    tags = {
        Name = "internet_igw"
    }
}

# route table

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.mtc_vpc.id
    tags = {
        Name = "public_route"
    }
}


resource "aws_route" "default_route" {
    route_table_id = aws_route_table.public_rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mtc_internet_gateway.id
}

resource "aws_default_route_table" "private_rt" {
    default_route_table_id = aws_vpc.mtc_vpc.default_route_table_id
    tags = {
        Name = "private_route"
    }
}

#route table association

resource "aws_route_table_association" "assoc" {
    subnet_id = aws_subnet.public_sub.id
    route_table_id = aws_route_table.public_rt.id
}




resource "aws_security_group" "allow_pub" {
  for_each = var.security_groups
  name        = each.value.name
  description = each.value.description
  vpc_id      = aws_vpc.mtc_vpc.id

  dynamic "ingress" {
    for_each = each.value.ingress
    content {
    from_port   = ingress.value.from
    to_port     = ingress.value.to
    protocol    = ingress.value.protocol
    cidr_blocks = ingress.value.cidr_blocks
  }
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_pub"
  }
}




resource "aws_security_group" "allow_priv" {
  for_each = var.private_sg
  name        = each.value.name
  description = each.value.description
  vpc_id      = aws_vpc.mtc_vpc.id

  dynamic "ingress" {
    for_each = each.value.ingress
    content {
    from_port   = ingress.value.from
    to_port     = ingress.value.to
    protocol    = ingress.value.protocol
    cidr_blocks = ingress.value.cidr_blocks
  }
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.123.0.0/16"]
  }

  tags = {
    Name = "allow_priv"
  }
}




