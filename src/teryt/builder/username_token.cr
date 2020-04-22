module TERYT
  class Builder
    def username_token(username, password)
      element("wsse:Security", { "soapenv:mustUnderstand" => "1", "xmlns:wsse" => "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd", "xmlns:wsu" => "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd" }) do
        element("wsse:UsernameToken") do
          element("wsse:Username") do
            text(username)
          end
          element("wsse:Password") do
            text(password)
          end
        end
      end
    end
  end
end
