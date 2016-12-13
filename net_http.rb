require 'net/http'
require 'open-uri'

def createfile(uri, username, pass, messagebody, contenttype)  #strings like "application/json"
  uri = URI(uri)
  req = Net::HTTP::Post.new(uri.to_s)
  req.basic_auth(username, pass)
  req.body = messagebody  # `to_json` can be used
  req["content-type"] = contenttype
  Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
    response = http.request(req)
    puts response
  end
end

#createfile("https://github.com/repos/:owner/:repo/contents/xyz.txt", "user", "pass","messagebody","application/json")
