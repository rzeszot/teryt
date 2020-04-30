module TERYT
  class NTS
    class District
      getter :id, :name, :extra, :kind
      def initialize(@id : String, @name : String, @extra : String, @kind : String)
      end
    end

    def list_districts(subregion_id, district_id)
      string = Builder.build do
        envelope do
          header do
            username_token(client.username, client.password)
            element("wsa:Action") do
              text("http://tempuri.org/ITerytWs1/PobierzListeGminPowiecie")
            end
          end
          body do
            element("ns1:PobierzListeGminPowiecie") do
              element("ns1:Pow") do
                text(district_id)
              end
              element("ns1:Podreg") do
                text(subregion_id)
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


      document.xpath_nodes("//xmlns:PobierzListeGminPowiecieResponse//b:JednostkaNomenklaturyNTS", namespaces: {"xmlns" =>"http://tempuri.org/", "b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).map do |item|
        name = item
          .xpath_node("b:NAZWA", {"b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).not_nil!.text
        id = item
          .xpath_node("b:GMI", {"b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).not_nil!.text
        extra = item
          .xpath_node("b:NAZWA_DOD", {"b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).not_nil!.text
        kind = item
          .xpath_node("b:RODZ", {"b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).not_nil!.text

        District.new(id, name, extra, kind)
      end
    end
  end
end
