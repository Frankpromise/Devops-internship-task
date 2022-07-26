#---root/main.tf----
# locals block



# create a module for networking

module "networking" {
  source          = "./networking"
  access_ip       = var.access_ip
  security_groups = local.security_groups
  private_sg      = local.private_sg
  vpc_cidr        = local.vpc_cidr
  public_cidrs    = local.public_cidrs
  private_cidr    = local.private_cidr


}



data "aws_ami" "latest-ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "centos" {
owners      = ["309956199498"]
most_recent = true


  filter {
      name   = "architecture"
      values = ["x86_64"]
  }

  filter {
      name   = "root-device-type"
      values = ["ebs"]
  }
  filter {
    name = "name"
    values = ["RHEL-8.6.0_HVM-20220503-x86_64-2-*"]
  }
}
resource "aws_instance" "web-server" {
  ami                    = data.aws_ami.latest-ubuntu.id
  instance_type          = "t2.micro"
  key_name               = var.ssh_private_key
  subnet_id              = module.networking.public_subnet
  vpc_security_group_ids = [module.networking.allow_pub]
  user_data               = "${file("script.sh")}"
   tags = {
    Name = "ubuntu"
    
}

     connection { 
    user        = "ubuntu"
    private_key = var.ssh_private_key
    host        = self.public_ip
  }
}



resource "aws_instance" "private-server" {
  ami                    = data.aws_ami.centos.id
  instance_type          = "t2.micro"
  key_name               = var.ssh_private_key
  subnet_id              = module.networking.private_subnet
  vpc_security_group_ids = [module.networking.allow_priv]
  user_data = "${file("nginx.sh")}"
  tags = {
    Name = "centos"
    
}

connection {
    user        = "ec2-user"
    vpc_security_group_ids = module.networking.allow_pub
    host        = self.private_ip
  }

}
