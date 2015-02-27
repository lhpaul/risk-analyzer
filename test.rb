require 'httparty'

response = HTTParty.get('http://localhost:8081/user/176988703')
puts response.length
response.each do | r |
  puts r['rol']
end