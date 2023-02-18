resource "digitalocean_record" "n8n" {
  domain = "christianbingman.com"
  type = "CNAME"
  name = "n8n"
  value = "web-proxy."
}
