module TERYT
  class NTS
    class Region
      getter :id, :name, :extra
      def initialize(@id : String, @name : String, @level : String)
      end
    end

    def list_regions
      string = Builder.build do
        envelope do
          header do
            username_token(client.username, client.password)
            element("wsa:Action") do
              text("http://tempuri.org/ITerytWs1/PobierzListeRegionow")
            end
          end
          body do
            element("ns1:PobierzListeRegionow") do
              element("ns1:DataStanu") do
                text("2020-04-22")
              end
            end
          end
        end
      end

      response = client.perform(string)
      body = response.body
      document = XML.parse(body)

      document.xpath_nodes("//xmlns:PobierzListeRegionowResponse//b:JednostkaNomenklaturyNTS", namespaces: {"xmlns" =>"http://tempuri.org/", "b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).map do |item|
        name = item
          .xpath_node("b:NAZWA", {"b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).not_nil!.text
        level = item
          .xpath_node("b:POZIOM", {"b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).not_nil!.text
        id = item
          .xpath_node("b:REGION", {"b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).not_nil!.text


        Region.new(id, name, level)
      end
    end
  end
end
