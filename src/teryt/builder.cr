module TERYT
  class Builder
    def self.build
      XML.build(encoding: "UTF-8", indent: "  ") do |xml|
        with new(xml) yield
      end
    end

    delegate element, to: @xml
    delegate text, to: @xml

    def initialize(@xml : XML::Builder)
    end
  end
end
