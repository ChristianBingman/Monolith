resource "digitalocean_record" "www" {
  domain = "christianbingman.com"
  type = "CNAME"
  name = "www"
  value = "web-proxy."
}
