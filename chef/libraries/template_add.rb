def add_template4(mode, user, the_filename, the_template, the_path, yourVarHash = 5)
  # SAMPLE USE
  # seedsHash = {:seeds => seeds}
  # status=add_template4("644", "user root or system", "hosts", "etc/hosts.erb", "/etc", seedsHash)

 # puts "#{the_filename} from #{the_template}"
    dhash = { :cookbook_name => cookbook_name, :recipe_name => recipe_name, :template_name => the_template }
    varhash=dhash
    varhash=dhash.merge(yourVarHash) unless yourVarHash.nil?
    puts varhash

    the_full_path=the_path+"/"+the_filename

    if File.file?(the_full_path) # file? will only return true for files
      puts "Checking: Already has #{the_full_path}"
      rstatus="updated"
      #bdate=`date +%y%m%d| tr -d '\n'` #backup date
    else
      puts "Adding file #{the_full_path}"
      rstatus="created"
      # {}`ls #{the_path} || mkdir -p #{the_path}`
    end

    template the_full_path do
      source the_template
      mode mode # stat -c "%a %n" /filename
      owner user
      group user
      variables (varhash)
    end
  puts rstatus
  return rstatus #return nil get out of meathod
end # add_template4 function
