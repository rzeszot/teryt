module TERYT
  class TERC
    class Voivodeship
      getter :id, :name
      def initialize(@id : String, @name : String)
      end
    end

    def list_voivodeship
      string = Builder.build do
        envelope do
          header do
            username_token(client.username, client.password)
            element("wsa:Action") do
              text("http://tempuri.org/ITerytWs1/PobierzListeWojewodztw")
            end
          end
          body do
            list_voivodeship("2020-04-22")
          end
        end
      end

      response = client.perform(string)
      puts response.status

      document = XML.parse(response.body)

      document.xpath_nodes("//s:Envelope/s:Body/xmlns:PobierzListeWojewodztwResponse/xmlns:PobierzListeWojewodztwResult/b:JednostkaTerytorialna", namespaces: {"s" => "http://schemas.xmlsoap.org/soap/envelope/","xmlns" =>"http://tempuri.org/", "b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).map do |item|
        id = item
          .xpath_node("b:WOJ", {"b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).not_nil!.text
        name = item
          .xpath_node("b:NAZWA", {"b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).not_nil!.text

        Voivodeship.new(id, name)
      end
    end
  end

  class Builder
    def list_voivodeship(date)
      element("ns1:PobierzListeWojewodztw") do
        element("ns1:DataStanu") do
          text(date)
        end
      end
    end
  end
end
