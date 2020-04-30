require "xml"
require "http/client"
require "./teryt/**"




module TERYT
  class TERC
    private getter :client

    def initialize(@client : Client)
    end
  end
end

module TERYT
  class NTS
    private getter :client

    def initialize(@client : Client)
    end
  end
end

client = TERYT::Client.new(ENV["TERYT_USERNAME"], ENV["TERYT_PASSWORD"])
# terc = TERYT::TERC.new(client)
# puts terc.list_voivodeship
# puts terc.list_county("14")
# puts terc.list_district("14", "36")


nts = TERYT::NTS.new(client)
# puts nts.list_regions
# puts nts.list_voivodeship("1")
# puts nts.list_subregions("14")
# puts nts.list_county("27")
# puts nts.list_districts("27", "36")


# <TERYT::NTS::Voivodeship:0x10fce96c0 @id="14", @name="MAZOWIECKIE">
# <TERYT::NTS::County:0x11055d9f0 @id="36", @name="zwoleński", @extra="powiat">
# <TERYT::NTS::District:0x10223a3c0 @id="02", @name="Policzna", @extra="gmina wiejska", @kind="2">

puts nts.list_streets("14", "36", "02", "2")


#
# [{
#   'GMI': None,
#   'NAZWA': 'CENTRALNY',
#   'NAZWA_DOD': 'region',
#   'PODREG': None,
#   'POW': None,
#   'POZIOM': '1',
#   'REGION': '1',
#   'RODZ': None,
#   'STAN_NA': '1/1/2017 12:00:00 AM',
#   'WOJ': None
# }, {
#
#
#   }, {
#       'GMI': None,
#       'NAZWA': 'MAZOWIECKIE',
#       'NAZWA_DOD': u'wojew\xf3dztwo',
#       'PODREG': None,
#       'POW': None,
#       'POZIOM': '2',
#       'REGION': '1',
#       'RODZ': None,
#       'STAN_NA': '1/1/2017 12:00:00 AM',
#       'WOJ': '14'
#   }]
#
#
#
#   }, {
#       'GMI': None,
#       'NAZWA': 'RADOMSKI',
#       'NAZWA_DOD': 'podregion',
#       'PODREG': '27',
#       'POW': None,
#       'POZIOM': '3',
#       'REGION': '1',
#       'RODZ': None,
#       'STAN_NA': '1/1/2017 12:00:00 AM',
#       'WOJ': '14'
#   }
#
#
#   }, {
#       'GMI': None,
#       'NAZWA': u'zwole\u0144ski',
#       'NAZWA_DOD': 'powiat',
#       'PODREG': '27',
#       'POW': '36',
#       'POZIOM': '4',
#       'REGION': '1',
#       'RODZ': None,
#       'STAN_NA': '1/1/2017 12:00:00 AM',
#       'WOJ': '14'
#   }]
#
#
#   }, {
#       'GMI': '02',
#       'NAZWA': 'Policzna',
#       'NAZWA_DOD': 'gmina wiejska',
#       'PODREG': '27',
#       'POW': '36',
#       'POZIOM': '5',
#       'REGION': '1',
#       'RODZ': '2',
#       'STAN_NA': '1/1/2017 12:00:00 AM',
#       'WOJ': '14'
#
# '14', '36', '02', '2', '1436022',


# }, {
#     'GmiRodzaj': '2',
#     'GmiSymbol': '1436022',
#     'Gmina': 'Policzna',
#     'Nazwa': u'\u0141uczyn\xf3w',
#     'PowSymbol': '1436',
#     'Powiat': u'zwole\u0144ski',
#     'Symbol': '0631930',
#     'WojSymbol': '14',
#     'Wojewodztwo': 'MAZOWIECKIE'


# 'GmiRodzaj': '2',
# 'GmiSymbol': '1436022',
# 'Gmina': 'Policzna',
# 'Nazwa': 'Policzna',
# 'PowSymbol': '1436',
# 'Powiat': u'zwole\u0144ski',
# 'Symbol': '0631999',
# 'WojSymbol': '14',
# 'Wojewodztwo': 'MAZOWIECKIE'
# }, {


# }, {
#     'Cecha': 'ul.',
#     'Gmi': '02',
#     'IdentyfikatorMiejscowosci': '0631999',
#     'IdentyfikatorMiejscowosciPodstawowej': '0631999',
#     'IndeksKlucza': 6L,
#     'Nazwa1': 'Kochanowskiego',
#     'Nazwa2': 'Jana',
#     'NazwaCechy': 'ulica',
#     'Pow': '36',
#     'RodzGmi': '2',
#     'StanNa': '2020-04-30',
#     'SymbolUlicy': '08728',
#     'Woj': '14'
# }, {



}, {
    'Cecha': 'ul.',
    'Gmi': '02',
    'IdentyfikatorMiejscowosci': '0631999',
    'IdentyfikatorMiejscowosciPodstawowej': '0631999',
    'IndeksKlucza': 9L,
    'Nazwa1': u'\u017beromskiego',
    'Nazwa2': 'Stefana',
    'NazwaCechy': 'ulica',
    'Pow': '36',
    'RodzGmi': '2',
    'StanNa': '2020-04-30',
    'SymbolUlicy': '26469',
    'Woj': '14'
}]


'Woj': '14'
}, {
'Cecha': 'ul.',
'Gmi': '02',
'IdentyfikatorMiejscowosci': '0631999',
'IdentyfikatorMiejscowosciPodstawowej': '0631999',
'IndeksKlucza': 9L,
'Nazwa1': u'\u017beromskiego',
'Nazwa2': 'Stefana',
'NazwaCechy': 'ulica',
'Pow': '36',
'RodzGmi': '2',
'StanNa': '2020-04-30',
'SymbolUlicy': '26469',
'Woj': '14'
}]
