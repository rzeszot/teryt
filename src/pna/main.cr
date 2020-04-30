require "http/client"

def fetch(url)
  HTTP::Client
    .get(url)
    .body
end

def get_resource_url : String | Nil
  response = fetch("https://www.poczta-polska.pl/spis-pna/")

  href = response
    .gsub(/.*id="tabfiles">/m, "")
    .gsub(/<\/div>.*/m, "")
    .match(/<a href="([^"]+)">/)
    .not_nil![1]

  "https://www.poczta-polska.pl" + href
rescue
  nil
end

#
#
#

exit(1) unless url = get_resource_url
puts url

pdf = fetch(url)
File.write("spispna.pdf", pdf)
