# Define required providers
terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "1.44.0"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
}


resource "openstack_compute_keypair_v2" "keypair_nuc" {
  name = "keypair_nuc"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINF54b9am7ZeD/CuwDx6I5zeLBVdSsU8ZVdxCU0fXFxs"
}


# Create a web security group
resource "openstack_compute_secgroup_v2" "web_server" {
  name        = "web_server"
  description = "Security Group Description"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 80
    to_port     = 80
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 443
    to_port     = 443
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}


# Create a web server
resource "openstack_compute_instance_v2" "web-server" {
  name            = "web-server"
  image_id        = "8fca8cb4-b4aa-4137-9dc1-f20b42f83078"
  flavor_name     = "a1-ram2-disk20-perf1"
  key_pair        = "keypair_nuc"
  security_groups = ["web_server"]

  metadata = {
    application = "web-app"
  }

  network {
    name = "ext-net1"
  }
}
