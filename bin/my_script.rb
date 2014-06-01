require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users.html', 
  query_values: {
  	'partner[name]' => 'starsky'
  }
).to_s

# puts RestClient.get(url)

# puts RestClient.post(url, {user: {username: "hutch"}})