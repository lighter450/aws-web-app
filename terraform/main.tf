provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# Get the default VPC
data "aws_vpc" "default" {
  default = true
}

resource "aws_instance" "web" {
  ami           = "ami-0c7217cdde317cfec" # Ubuntu 22.04 для us-east-1
  instance_type = "t2.micro"
  key_name      = "keylab1"               # заміни на назву свого .pem ключа
  
  tags = {
    Name = "Terraform-WebApp"
  }
  
  vpc_security_group_ids = [aws_security_group.web_sg.id]
}
