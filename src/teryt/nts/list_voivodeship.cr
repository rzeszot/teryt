module TERYT
  class NTS
    class Voivodeship
      getter :id, :name
      def initialize(@id : String, @name : String)
      end
    end

    def list_voivodeship(region_id)
      string = Builder.build do
        envelope do
          header do
            username_token(client.username, client.password)
            element("wsa:Action") do
              text("http://tempuri.org/ITerytWs1/PobierzListeWojewodztwWRegionie")
            end
          end
          body do
            element("ns1:PobierzListeWojewodztwWRegionie") do
              element("ns1:Reg") do
                text(region_id)
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

      document.xpath_nodes("//xmlns:PobierzListeWojewodztwWRegionieResult//b:JednostkaNomenklaturyNTS", namespaces: {"xmlns" =>"http://tempuri.org/", "b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).map do |item|
        name = item
          .xpath_node("b:NAZWA", {"b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).not_nil!.text
        id = item
          .xpath_node("b:WOJ", {"b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).not_nil!.text

        Voivodeship.new(id, name)
      end
    end
  end
end
