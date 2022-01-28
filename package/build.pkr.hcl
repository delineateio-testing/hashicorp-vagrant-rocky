variable "box_path" {
  type    = string
  default = "bento/rockylinux-8"
}

variable "box_version" {
  type    = string
  default = "v202112.19.0"
}

variable "cloud_token" {
  type    = string
  default = "${env("VAGRANT_CLOUD_TOKEN")}"
}

# virtualbox
source "vagrant" "virtualbox" {
  box_name              = "development_virtualbox"
  output_dir            = "build/virtualbox"
  communicator          = "ssh"
  provider              = "virtualbox"
  source_path           = "${var.box_path}"
  box_version           = "${var.box_version}"
  vagrantfile_template  = "template.tpl"
  add_force             = true
  skip_add              = true
}

# vmware desktop
source "vagrant" "vmware_desktop" {
  box_name              = "development_vmware"
  output_dir            = "build/vmware_desktop"
  communicator          = "ssh"
  provider              = "vmware_desktop"
  source_path           = "${var.box_path}"
  box_version           = "${var.box_version}"
  vagrantfile_template  = "template.tpl"
  add_force             = true
  skip_add              = true
}

build {

  sources = ["source.vagrant.vmware_desktop"]
#  sources = ["source.vagrant.virtualbox", "source.vagrant.vmware_desktop"]

  provisioner "shell" {
    inline = ["sudo yum install -y ansible", "mkdir -p /etc/ansible"]
  }

  # copies to expected location to avoid world writeable warning
  # as per the vagrant documentation you can't upload directly to root locations
  # https://docs.ansible.com/ansible/devel/reference_appendices/config.html#cfg-in-world-writable-dir
  provisioner "file" {
    source = "../ansible.cfg"
    destination = "/tmp/ansible.cfg"
  }
  provisioner "shell" {
    inline = ["sudo mv /tmp/ansible.cfg /etc/ansible/ansible.cfg"]
  }

  provisioner "ansible-local" {

    staging_directory = "/tmp"
    playbook_dir      = "../ansible"
    playbook_files    = ["../ansible/bootstrap.yml",
                          "../ansible/git.yml",
                          "../ansible/languages.yml",
                          "../ansible/cloud.yml",
                          "../ansible/hashicorp.yml",
                          "../ansible/docker.yml",
                          "../ansible/osquery.yml",
                          "../ansible/starship.yml",
                          "../ansible/harden.yml"]
  }

  post-processor "vagrant-cloud" {
    access_token = "${var.cloud_token}"
    version_description = "Development box for use for quick demos and experitmentation"
    box_tag      = "delineateio/development"
    version      = "0.0.2"
    no_direct_upload = true
  }
}
