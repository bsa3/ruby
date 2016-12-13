require 'net/http'

def post (URI, Username, Pass, content-type)  #strings like "application/json"
  uri = URI(URI)
  req = Net::HTTP::Post.new(uri.to_s)
  req.basic_auth(Username, Pass)
  req.body = '{"body": "Test message"}'  # `to_json` can be used
  req["content-type"] = content-type
  Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
    p response = http.request(req)
  end
end
