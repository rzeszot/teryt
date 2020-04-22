require "xml"
require "http/client"
require "./teryt/**"


client = TERYT::Client.new(ENV["TERYT_USERNAME"], ENV["TERYT_PASSWORD"])
# puts client.list_voivodeship

# puts client.list_county("14")

puts client.list_district("14", "36")
