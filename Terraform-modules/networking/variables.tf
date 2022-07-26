#--- networking/variables.tf

# cidr variable for vpc_cidr

variable "vpc_cidr" {
    type = string
}
 variable "public_cidrs"{
     type = string
 }
 
 variable "private_cidr"{}
variable "access_ip" {
    default = "0.0.0.0/0"
}

variable "security_groups" {
    type = map
}

variable "private_sg" {}
