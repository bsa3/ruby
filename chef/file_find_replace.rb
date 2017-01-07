if File.readlines(configfile).grep(/#{new_validation_name}/).size > 0
  puts "Skipping."
else
    # works in chef-client 12.8.1 on centos
    fe = Chef::Util::FileEdit.new("/etc/chef/client.rb")

    #search regex string has no quotes just //

    fe.search_file_replace_line(/chef_server_url/, "chef_server_url \"#{newuri}\"\n")

    fe.search_file_replace_line(/#{old_validation_name}/, "validation_client_name \"#{new_validation_name}\"\n")

    fe.insert_line_if_no_match(/#{node.chef_environment}/,"environment  \"#{node.chef_environment}\"\n")

    fe.write_file

end
