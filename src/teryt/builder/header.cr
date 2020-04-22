module TERYT
  class Builder
    def header
      element("soapenv:Header", { "xmlns:wsa" => "http://www.w3.org/2005/08/addressing" }) do
        with self yield
      end
    end
  end
end
