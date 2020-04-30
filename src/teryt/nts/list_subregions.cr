module TERYT
  class NTS
    class Subregion
      getter :id, :name
      def initialize(@id : String, @name : String)
      end
    end

    def list_subregions(voivodeship_id)
      string = Builder.build do
        envelope do
          header do
            username_token(client.username, client.password)
            element("wsa:Action") do
              text("http://tempuri.org/ITerytWs1/PobierzListePodregionow")
            end
          end
          body do
            element("ns1:PobierzListePodregionow") do
              element("ns1:Woj") do
                text(voivodeship_id)
              end
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

      document.xpath_nodes("//xmlns:PobierzListePodregionowResponse//b:JednostkaNomenklaturyNTS", namespaces: {"xmlns" =>"http://tempuri.org/", "b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).map do |item|
        name = item
          .xpath_node("b:NAZWA", {"b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).not_nil!.text
        id = item
          .xpath_node("b:PODREG", {"b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).not_nil!.text

        Subregion.new(id, name)
      end
    end
  end
end
