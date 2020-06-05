# Class to load SPARQL from local files
class SparqlLoader
 
  def self.productions
    File.read('app/services/sparqls/productions.sparql')
  end
end