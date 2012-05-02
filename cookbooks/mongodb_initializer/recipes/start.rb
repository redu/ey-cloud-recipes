execute "start mongodb" do
  Chef::Log.info "Executing Mondodb"
  command "/opt/mongodb-linux-i686-2.0.4/bin/mongod --repair"
  command "/opt/mongodb-linux-i686-2.0.4/bin/mongod --fork --logpath /var/log/mongodb.log --logappend"
  Chef::Log.info "Mongodb executed"
  action :run
end
