Vagrant::Config.run do |config|

  config.vm.define :puppet do |conf|
    conf.vm.box_url = "http://files.vagrantup.com/precise64.box"
    conf.vm.box = "precise64"
    conf.vm.host_name = "puppet" 
    conf.vm.network :hostonly, "192.168.33.10"

    conf.vm.provision :puppet, :module_path => "puppet/modules" do |puppet|
      puppet.manifests_path = "puppet"
      puppet.manifest_file  = "puppet.pp"
    end

  end

  config.vm.define :agent do |conf|
    conf.vm.box_url = "http://files.vagrantup.com/precise64.box"
    conf.vm.box = "precise64"
    conf.vm.host_name = "agent" 
    conf.vm.network :hostonly, "192.168.33.11"

    conf.vm.provision :puppet, :module_path => "puppet/modules" do |puppet|
      puppet.manifests_path = "puppet"
      puppet.manifest_file  = "agent.pp"
    end
  end
end
