module TERYT
  class County
    getter :id, :name, :extra
    def initialize(@id : String, @name : String, @extra : String)
    end
  end

  class Client
    def list_county(voivodeship_id)
      string = Builder.build do
        envelope do
          header do
            username_token(username, password)
            element("wsa:Action") do
              text("http://tempuri.org/ITerytWs1/PobierzListePowiatow")
            end
          end
          body do
            element("ns1:PobierzListePowiatow") do
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

      response = perform(string)
      puts response.status
      body = response.body

      document = XML.parse(body)
      document.xpath_nodes("//xmlns:PobierzListePowiatowResponse//b:JednostkaTerytorialna", namespaces: {"xmlns" =>"http://tempuri.org/", "b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).map do |item|
        name = item
          .xpath_node("b:NAZWA", {"b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).not_nil!.text
        id = item
          .xpath_node("b:POW", {"b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).not_nil!.text
        extra = item
          .xpath_node("b:NAZWA_DOD", {"b"=>"http://schemas.datacontract.org/2004/07/TerytUslugaWs1"}).not_nil!.text


        County.new(id, name, extra)
      end
    end
  end
end
