terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

resource "aws_key_pair" "ansible_pub" {
  key_name = "ansible_pub"
  public_key = chomp(file("../ansible/files/ansible.pub"))
}

