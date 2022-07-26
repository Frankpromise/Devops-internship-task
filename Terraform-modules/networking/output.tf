#--networking/output.tf

output "vpc_id" {
    value = aws_vpc.mtc_vpc.id
}
 output  "public_subnet" {
     value = aws_subnet.public_sub.id
 }
 
 output "allow_pub" {
     value = aws_security_group.allow_pub["public"].id
 }
 
 output "private_subnet" {
     value = aws_subnet.private_sub.id
 }
 
 output "allow_priv" {
     value = aws_security_group.allow_priv["private"].id
 }