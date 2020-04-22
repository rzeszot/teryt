module TERYT
  class Builder
    def envelope
      element("soapenv:Envelope", { "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/", "xmlns:ns1" => "http://tempuri.org/" }) do
        with self yield
      end
    end
  end
end
