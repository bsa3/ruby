
#platform
platform = node["platform"].to_s

default.cookbookname.featurename = {
      "key" => "value" }

case platform
	when "windows" #double checking platform
    default.cookbookname.featurename.FullFilePaths = [ "/windows/logs/x.log", "/windows/logs/y.log" ]
	  default.cookbookname.featurename.FullDirPaths = [ "/Windows/Temp/" ] #don't forget trailing slash
 
	when "centos", "redhat" #double checking platform
    default.cookbookname.featurename.FullFilePaths = [   "/var/log/x.log",
        "/var/log/y.log" ]
    default.diskcleanup.dirwackerkey.FullDirPaths = [  "/tmp/Trash/"  ] #don't forget trailing slash
else
  puts "# Unknown platform in default attributes file!!!"
end #case switch
