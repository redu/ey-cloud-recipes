# TO-DO: replace with portage version. Check for 32bit on i686 systems (for arbiter only installs)
file_to_fetch = "http://fastdl.mongodb.org/linux/mongodb-linux-i686-2.0.4.tgz"

execute "fetch #{file_to_fetch}" do
  cwd "/tmp"
  command "wget #{file_to_fetch}"
  not_if { FileTest.exists?("/tmp/mongodb-linux-i686-2.0.4.tgz") }
end

execute "untar /tmp/mongodb-linux-i686-2.0.4.tgz" do
  command "cd /tmp; tar zxf mongodb-linux-i686-2.0.4.tgz -C /opt"
  not_if { FileTest.directory?("/opt/mongodb-linux-i686-2.0.4") }
end

execute "" do
  command "ln -s /opt/mongodb-linux-i686-2.0.4/bin/mongodump ./usr/bin/mongodump"
end
