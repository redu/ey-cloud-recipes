execute "start mongodb" do
  Chef::Log.info "Executing Mondodb"
  command "/opt/mongodb-linux-i686-2.0.4/bin/mongod"
  Chef::Log.info "Mongodb executed"
  action :run
end
