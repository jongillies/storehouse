#!/usr/bin/env ruby

require 'rest-client'
require 'crack'
require 'yaml'
require 'moneta'

YAML::ENGINE.yamler = 'syck'

url = 'http://localhost:3000'
path = 'data_sources.json'
auth_token = 'z0000000000000000000'

resource = RestClient::Resource.new url

x =  resource["#{path}?auth_token=#{auth_token}"].get

data_sources = Crack::JSON.parse(x)

data_sources.each do |ds|
  puts ds['primary_store']
end

puts "Testing store: #{data_sources[1]['primary_store']}"

store = eval("Moneta.new(#{data_sources[1]['primary_store']})")

if store.key? 'key'
  puts 'key exists'
else
  puts 'created key'
  store['key'] = 'value'
end

store.close

data_sources[1]['secondary_stores'].split('|').each do |ds|

  store = eval("Moneta.new(#{ds})")

  if store.key? 'key'
    puts 'key exists'
  else
    puts 'created key'
    store['key'] = 'value'
  end

  store.close

end






