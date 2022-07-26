
locals {
  vpc_cidr = "10.123.0.0/16"
}

locals {
  public_cidrs = "10.123.1.0/24"
}

locals {
  private_cidr = "10.123.6.0/24"
}


locals {
  security_groups = {
    public = {
      name        = "allow_public"
      description = "Allow SSH,HTTP,HTTPS, ICMP inbound traffic"
      ingress = {
        ssh = {
          from        = 22
          to          = 22
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
    
        http = {
          from        = 80
          to          = 80
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        https = {
          from        = 443
          to          = 443
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        ICMP = {
          from        = "8"
          to          = "0"
          protocol    = "icmp"
          cidr_blocks = [var.access_ip]
        }
      }
    }


  }
}


locals {
  private_sg = {


    private = {
      name        = "private_sg"
      description = "Allow SSH, ICMP, HTTP,HTTPS inbound traffic"
      ingress = {
        ssh = {
          from        = 22
          to          = 22
          protocol    = "tcp"
          cidr_blocks = ["10.123.0.0/16"]
        }
        
        http = {
          from = 80
          to = 80
          protocol = "tcp"
          cidr_blocks = ["10.123.0.0/16"]
        }
        https = {
          from        = 443
          to          = 443
          protocol    = "tcp"
          cidr_blocks = ["10.123.0.0/16"]
        }
        ICMP = {
          from        = "8"
          to          = "0"
          protocol    = "icmp"
          cidr_blocks = ["10.123.0.0/16"]
        }
      }
    }
  }
}