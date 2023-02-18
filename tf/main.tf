provider "aws" {
  region = "us-east-2"
}

module "aws" {
  source = "./aws"
}

module "digitalocean" {
  source = "./digitalocean"
}

output "web-proxy_instance" {
  value = module.aws.web-proxy_instance
}

output "web-proxy_fqdn" {
  value = module.aws.web-proxy_fqdn
}
