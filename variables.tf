variable "vcd_user" {
  description = "vCloud Director username"
  type        = string
}

variable "vcd_password" {
  description = "vCloud Director password"
  type        = string
  sensitive   = true
}

variable "vcd_org" {
  description = "vCloud Director organization"
  type        = string
}

variable "vcd_url" {
  description = "vCloud Director API URL"
  type        = string
}

variable "vcd_vdc" {
  description = "vCloud Director VDC (Virtual Data Center)"
  type        = string
}

variable "vapp_name" {
  description = "vApp name"
  type        = string
  default     = "my-vapp"
}

variable "vm_name" {
  description = "Virtual Machine name"
  type        = string
  default     = "my-vm"
}

variable "catalog_name" {
  description = "Name of the catalog containing the VM template"
  type        = string
}

variable "template_name" {
  description = "Name of the VM template"
  type        = string
}

variable "vm_memory" {
  description = "Memory size of the VM (in MB)"
  type        = number
  default     = 2048
}

variable "vm_cpus" {
  description = "Number of CPUs for the VM"
  type        = number
  default     = 2
}

variable "network_name" {
  description = "Network to connect the VM"
  type        = string
}

variable "vm_ip" {
  description = "IP address for the VM"
  type        = string
}