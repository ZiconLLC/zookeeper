case node[:zookeeper][:service_style]
when 'runit'
  runit_service 'zookeeper' do
    default_logger true
    options({
      exec: executable_path
    })
    action [:restart]
  end
when 'exhibitor'
  Chef::Log.info("Assuming Exhibitor will start up Zookeeper.")
else
  Chef::Log.error("You specified an invalid service style for Zookeeper, but I am continuing.")
end

