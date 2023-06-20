# The configuration for the `local` backend.

terraform {
  backend "local" {
    path = "/home/jimmy/tf-state"
  }
}

resource "digitalocean_droplet" "www-1" {
    image = "ubuntu-20-04-x64"
    name = "www-1"
    region = "nyc3"
    size = "s-1vcpu-1gb"
    ssh_keys = [
      data.digitalocean_ssh_key.terraform.id
    ]
}