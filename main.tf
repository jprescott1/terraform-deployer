terraform {
  backend "gcs" {
    bucket = "do-tf-state"
    prefix = "./tf-deploy"
  }
}

resource "digitalocean_droplet" "www-1" {
  image  = "ubuntu-20-04-x64"
  name   = "www-1"
  region = "nyc3"
  size   = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]
}