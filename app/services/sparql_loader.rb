# Class to load SPARQL from local files
class SparqlLoader
 
  def self.load(filename)
    File.read("app/services/sparqls/#{filename}.sparql")
  end
end