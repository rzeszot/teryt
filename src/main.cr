require "xml"
require "http/client"
require "./teryt/**"




module TERYT
  class TERC
    private getter :client

    def initialize(@client : Client)
    end
  end
end

module TERYT
  class NTS
    private getter :client

    def initialize(@client : Client)
    end
  end
end

client = TERYT::Client.new(ENV["TERYT_USERNAME"], ENV["TERYT_PASSWORD"])
# terc = TERYT::TERC.new(client)
# puts terc.list_voivodeship
# puts terc.list_county("14")
# puts terc.list_district("14", "36")


nts = TERYT::NTS.new(client)
# puts nts.list_regions
# puts nts.list_voivodeship("1")
# puts nts.list_subregions("14")
# puts nts.list_county("27")
# puts nts.list_districts("27", "36")

puts nts.list_streets("1", "02", "2")
