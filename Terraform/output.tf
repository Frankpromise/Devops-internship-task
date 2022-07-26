output "public_ip" {
  value = aws_instance.ubuntu.public_ip
}

output "private_ip" {
  value = aws_instance.centos.public_ip
}

output "server_ubuntu" {
  value = aws_instance.ubuntu.tags
}

output "server_centos" {
  value = aws_instance.centos.tags
}