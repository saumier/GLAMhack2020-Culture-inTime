

# Class to load productions from sparql into local db
class LoadPerformances

  def initialize
    @client = ArtsdataAPI::V1::Client.new()
  end

  def canada(production_uri)
    @client.execute_sparql(SparqlLoader.load("canadian_performances", "http://kg.artsdata.ca/resource/dansedanse-ca_animals-distinction-frontera", production_uri))
  end

end