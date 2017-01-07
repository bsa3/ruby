def file_add(mode, owner, group, install_drive, the_path, the_filename, environment)
  # SAMPLE
  # add_file("0755", "Administrators", "Users", "#{installdrive}", "#{installpath}", the_filename, "")
  if File.exist?(install_drive)
    the_full_path = install_drive + "/" + the_path + "/" + the_filename
      puts "-Checking: " + the_full_path
    source_path = the_path + "/" + the_filename + environment
      #puts source_path
    new_dir = install_drive + "/" + the_path

    create_dir(mode, owner, group, new_dir) unless File.directory?(new_dir)

    cookbook_file the_full_path do
        source source_path
        owner owner
        group group
        mode mode  # stat -c "%a %n" /filename
    end
  end
end
