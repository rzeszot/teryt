module TERYT
  class Builder
    def body
      element("soapenv:Body") do
        with self yield
      end
    end
  end
end
