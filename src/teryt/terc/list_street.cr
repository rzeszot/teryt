# module TERYT
#   # class District
#   #   getter :id, :name, :extra
#   #   def initialize(@id : String, @name : String, @extra : String, @kind : String)
#   #   end
#   # end
#
#   class Client
#     def list_street(voivodeship_id, county_id, istrict_id)
#       string = Builder.build do
#         envelope do
#           header do
#             username_token(username, password)
#             element("wsa:Action") do
#               text("http://tempuri.org/ITerytWs1/PobierzListeRegionow")
#             end
#           end
#           body do
#             element("ns1:PobierzListeRegionow") do
#               element("ns1:DataStanu") do
#                 text("2020-04-22")
#               end
#             end
#           end
#         end
#       end
#
#       puts string
#
#       # response = perform(string)
#       # puts response.status
#       # body = response.body
#       #
#       # document = XML.parse(body)
#       # document.xpath_nodes("//xmlns:PobierzListeGminResponse//b:JednostkaTerytorialna", namespaces: {"xmlns" =>"http://tempuri.org/", "b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).map do |item|
#       #   id = item
#       #     .xpath_node("b:GMI", {"b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).not_nil!.text
#       #   name = item
#       #     .xpath_node("b:NAZWA", {"b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).not_nil!.text
#       #   extra = item
#       #     .xpath_node("b:NAZWA_DOD", {"b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).not_nil!.text
#       #   kind = item
#       #     .xpath_node("b:RODZ", {"b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).not_nil!.text
#       #
#       #   District.new(id, name, extra, kind)
#       # end
#     end
#   end
# end
