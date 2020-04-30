module TERYT
  class NTS
    class Region
      getter :id, :name, :extra
      def initialize(@id : String, @name : String, @level : String)
      end
    end

    def list_streets(voivodeship_id, county_id, district_id, kind)
      string = Builder.build do
        envelope do
          header do
            username_token(client.username, client.password)
            element("wsa:Action") do
              text("http://tempuri.org/ITerytWs1/PobierzListeUlicDlaMiejscowosci")
            end
          end
          body do
            element("ns1:PobierzListeUlicDlaMiejscowosci") do
              element("ns1:Woj") do
                text(voivodeship_id)
              end
              element("ns1:Pow") do
                text(county_id)
              end
              element("ns1:Gmi") do
                text(district_id)
              end
              element("ns1:Rodz") do
                text(kind)
              end
              element("ns1:msc") do
                text([voivodeship_id, county_id, district_id, kind].join)
              end
              element("ns1:czyWersjaUrzedowa") do
                text("true")
              end
              element("ns1:czyWersjaAdresowa") do
                text("false")
              end
              element("ns1:DataStanu") do
                text("2020-04-22")
              end
            end
          end
        end
      end

      puts string

      response = client.perform(string)
      body = response.body
      document = XML.parse(body)
      puts document
      # document.xpath_nodes("//xmlns:PobierzListeRegionowResponse//b:JednostkaNomenklaturyNTS", namespaces: {"xmlns" =>"http://tempuri.org/", "b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).map do |item|
      #   name = item
      #     .xpath_node("b:NAZWA", {"b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).not_nil!.text
      #   level = item
      #     .xpath_node("b:POZIOM", {"b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).not_nil!.text
      #   id = item
      #     .xpath_node("b:REGION", {"b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).not_nil!.text
      #
      #
      #   Region.new(id, name, level)
      # end
    end
  end
end
