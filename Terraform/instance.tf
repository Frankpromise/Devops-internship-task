resource "aws_key_pair" "dove_key" {
  key_name   = "dove_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "ubuntu" {
  ami                    = var.ami_ubuntu
  subnet_id = aws_subnet.public_sub.id
  availability_zone = var.zone1
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_public.id]
  key_name               = aws_key_pair.dove_key.key_name
  tags = {
    Name = "ubuntu"
  }
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
  }
  connection {
    user        = var.user
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }
}



resource "aws_instance" "centos" {
  ami                    = var.ami_centos
  instance_type          = "t2.micro"
  subnet_id = aws_subnet.private_sub.id
  availability_zone = var.zone2
  vpc_security_group_ids = [aws_security_group.allow_private.id]
  key_name               = aws_key_pair.dove_key.key_name
  tags = {
    Name = "centos"
  }
}