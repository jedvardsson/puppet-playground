Vagrant::Config.run do |config|

  config.vm.define :puppet do |conf|
    conf.vm.box_url = "http://files.vagrantup.com/precise64.box"
    conf.vm.box = "precise64"
    conf.vm.host_name = "puppet" 
    conf.vm.network :hostonly, "192.168.33.10"
  end

  config.vm.define :node1 do |conf|
    conf.vm.box_url = "http://files.vagrantup.com/precise64.box"
    conf.vm.box = "precise64"
    conf.vm.host_name = "node1" 
    conf.vm.network :hostonly, "192.168.33.11"
  end

  config.vm.provision :puppet, :module_path => "puppet/modules" do |puppet|
    puppet.manifests_path = "puppet"
    puppet.manifest_file  = "bootstrap.pp"
  end
end
