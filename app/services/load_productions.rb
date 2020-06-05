# Class to load productions from sparql into local db
class LoadProductions
  client = ArtsdataAPI::V1::Client.new()
  puts client.execute_sparql(SparqlLoader.productions)

end