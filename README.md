# howto work in docker
- docker build -t someone/somename:1.0 . 
- docker run -ti -v $(pwd):/workplace someone/somename:1.0 /bin/bash


# Howto

- mv terraform.tfvars.sample terraform.tfvars  # and fill in
- change cloud-init files in cloud-init dir
- terraform init
- terraform plan
- terraform apply
- VM is running ;-)

# Reference links

- https://github.com/aucloud/terraform-vcd-vm-deploy main inspiration
- [VCD terraform provider](https://registry.terraform.io/providers/vmware/vcd/latest/docs)
- [Terraform docs](https://developer.hashicorp.com/terraform/docs)
- [VCD docs](https://docs.vmware.com/en/VMware-Cloud-Director/index.html)
- [Cloud init](https://cloud-init.io)
