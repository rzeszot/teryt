module TERYT
  class Client
    getter :username, :password, :endpoint

    def initialize(@username : String, @password : String)
      @endpoint = "https://uslugaterytws1.stat.gov.pl/terytws1.svc"
    end

    def is_logged?
      Builder.build do
        envelope do
          header do
            username_token(username, password)
            element("wsa:Action") do
              text("http://tempuri.org/ITerytWs1/PobierzListeWojewodztw")
            end
          end
          body do
            element("ns1:PobierzListeWojewodztw") do
              element("ns1:parameters") do
                element("ns1:DataStanu") do
                  text("2020-04-22")
                end
              end
            end
          end
        end
      end
    end

    private def perform(body)
      headers = HTTP::Headers{ "Content-Type" => "text/xml" }
      HTTP::Client.post(@endpoint, headers: headers, body: body)
    end
  end
end
