VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.berkshelf.enabled = true;
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "./"
    chef.add_recipe "spark-notebook-simple"
  end
end
