require 'net/http'

def createfile(uri, username, pass, message, contenttype)  #strings like "application/json"
  uri = URI(uri)
  req = Net::HTTP::Post.new(uri.to_s)
  req.basic_auth(username, pass)
  req.body = '{"body": message}'  # `to_json` can be used
  req["content-type"] = contenttype
  Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
    response = http.request(req)
    response
  end
end

#createfile("https://github.com/repos/:owner/:repo/contents/xyz.txt", "user", "pass","message","application/json")
