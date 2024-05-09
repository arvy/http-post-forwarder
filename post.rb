require 'sinatra'
require 'json'
require 'uri'
require 'net/http'

set :bind, '0.0.0.0'

uri = URI('https://slack.com/api/chat.postMessage')

post '/' do
    puts "body: #{ request.body.read }"              # request body sent by the client (see below)
    puts "method: #{ request.request_method }"   # "GET"
    puts "content_length: #{request.content_length }"   # length of request.body
    puts "media_type: #{request.media_type }"       # media type of request.body
    puts "form_data?: #{request.form_data? }"       # false
    puts JSON.pretty_generate(request.env)

    res = Net::HTTP.post(uri, request.body.to_json, headers)
    puts res.body  if res.is_a?(Net::HTTPSuccess)
    res
#    request.env               # raw env hash handed in by Rack
end