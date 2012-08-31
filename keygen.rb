require 'net/http'
require "uri"

uri = URI.parse("http://web2-zenk-security.alwaysdata.net/keygenmefast/keygenmefast.php")
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.request_uri)
response = http.request(request)
response["X-Pseudo-Keygenmefast"]
