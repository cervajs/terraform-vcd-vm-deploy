terraform {
  required_providers {
    vcd = {
      source  = "vmware/vcd"
      version = "3.14" 
    }
  }
}

provider "vcd" {
  user                 = var.vcd_user
  password             = var.vcd_password
  org                  = var.vcd_org
  url                  = var.vcd_url
  vdc                  = var.vcd_vdc
  allow_unverified_ssl = true
}

resource "vcd_vapp_org_network" "some-network" {
  vapp_name        = vcd_vapp.my_vapp.name
  org_network_name = var.network_name
}

resource "vcd_vapp" "my_vapp" {
  name          = var.vapp_name
}

resource "vcd_vapp_vm" "my_vm" {
  name          = var.vm_name
  catalog_name  = var.catalog_name
  template_name = var.template_name
  vapp_name     = vcd_vapp.my_vapp.name
  memory        = var.vm_memory
  cpus          = var.vm_cpus

  network  {
    type = "org"
    name = var.network_name
    ip_allocation_mode = "POOL" # MANUAL for static ip 
    is_primary         = true
  }


  guest_properties = {
    #https://cloudinit.readthedocs.io/en/latest/reference/network-config.html
    "network-config" = "${base64encode(file("${path.module}/cloud-init/network-config.yml"))}",
    "user-data" = "${base64encode(file("${path.module}/cloud-init/user-data.yml"))}"
  }
}

# output "vm_ip" {
#   value = vcd_vapp_vm.my_vm.ip
# }
