# TO-DO: replace with portage version. Check for 32bit on i686 systems (for arbiter only installs)
file_to_fetch = "http://fastdl.mongodb.org/linux/mongodb-linux-i686-2.0.4.tgz"

execute "fetch #{file_to_fetch}" do
  Chef::Log.info "Downloading MongoDB file"
  cwd "/tmp"
  command "wget #{file_to_fetch}"
  not_if { FileTest.exists?("/tmp/mongodb-linux-i686-2.0.4.tgz") }
end

execute "untar /tmp/mongodb-linux-i686-2.0.4.tgz" do
  Chef::Log.info "Copying mongodb file"
  command "cd /tmp; tar zxf mongodb-linux-i686-2.0.4.tgz -C /opt"
  not_if { FileTest.directory?("/opt/mongodb-linux-i686-2.0.4") }
end

execute "creating a symbolik link" do
  Chef::Log.info "Creating a symbolic link to mongodump"
  command "ln -s /opt/mongodb-linux-i686-2.0.4/bin/mongodump /usr/bin/mongodump"
  not_if { FileTest.exists?("/usr/bin/mongodump") }
end

execute "/o/" do
  command "sudo /opt/mongodb-linux-i686-2.0.4/bin/mongod --repair"
end

execute "start mongodb" do
  Chef::Log.info "Executing Mongodb"
  command "sudo /opt/mongodb-linux-i686-2.0.4/bin/mongod --fork --logpath /var/log/mongodb.log --logappend"
  Chef::Log.info "Mongodb executed"
end
