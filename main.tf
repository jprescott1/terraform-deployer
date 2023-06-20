# The configuration for the `local` backend.

terraform {
  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "example-org-0ea620"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "getting-started"
    }
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