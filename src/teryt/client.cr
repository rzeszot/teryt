module TERYT
  class Client
    getter :username, :password, :endpoint

    def initialize(@username : String, @password : String)
      @endpoint = "https://uslugaterytws1.stat.gov.pl/terytws1.svc"
    end

    def perform(body)
      headers = HTTP::Headers{ "Content-Type" => "text/xml" }
      HTTP::Client.post(@endpoint, headers: headers, body: body)
    end
  end
end
