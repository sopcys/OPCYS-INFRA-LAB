
https://registry.terraform.io/

## openstack provider
https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs

```openstack
# Define required providers
terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  # user_name   = "admin" => inutilisé car passé dans fichier openrc
  # tenant_name = "admin"
  # password    = "pwd"
  # auth_url    = "http://myauthurl:5000/v3"
  # region      = "RegionOne"
}

# Create a web server
resource "openstack_compute_instance_v2" "test-server" {
  # ...
}
```
