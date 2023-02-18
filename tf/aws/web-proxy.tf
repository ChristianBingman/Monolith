resource "aws_security_group" "terraform-web-proxy-sg" {
  name = "Terraform-Web-Proxy-SG"
  description = "Terraformed Web Proxy Security Group"

  // To Allow SSH Transport
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  // To Allow Port 80 Transport
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  // To Allow Port 443 Transport
  ingress {
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "terraform-web-proxy" {
  ami           = "ami-04e74eee4c8aab81c"
  instance_type = "t4g.nano"
  associate_public_ip_address = true
  key_name = aws_key_pair.ansible_pub.id


  vpc_security_group_ids = [
    aws_security_group.terraform-web-proxy-sg.id
  ]

  tags = {
    Name ="WEBPROXY"
    Environment = "PROD"
    OS = "UBUNTU"
    Managed = "IAC"
  }

  depends_on = [ aws_security_group.terraform-web-proxy-sg, aws_key_pair.ansible_pub ]
}

resource "aws_eip" "terraform-web-proxy-elastic" {
  instance = aws_instance.terraform-web-proxy.id
  vpc      = true
}

resource "digitalocean_record" "web-proxy" {
  domain = "christianbingman.com"
  type = "A"
  name = "web-proxy"
  value = aws_eip.terraform-web-proxy-elastic.public_ip
}

resource "digitalocean_record" "domain" {
  domain = "christianbingman.com"
  type = "A"
  name = "@"
  value = aws_eip.terraform-web-proxy-elastic.public_ip
}

output "web-proxy_instance" {
  value = aws_eip.terraform-web-proxy-elastic.public_ip
}

output "web-proxy_fqdn" {
  value = digitalocean_record.web-proxy.fqdn
}
