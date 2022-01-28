# encoding: utf-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION ||= "2"

Vagrant.require_version ">=2.2.18"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.hostname = "development"
  config.vm.box = "delineateio/development"

  # mounts ansible scripts only
  config.vm.synced_folder ".", "/code"

end
