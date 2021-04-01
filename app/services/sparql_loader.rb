# Class to load SPARQL from local files
class SparqlLoader
 
  def self.load(filename, str_to_replace = '', value = '' )
    File
      .read("app/services/sparqls/#{filename}.sparql")
      .gsub(str_to_replace,value)
  end
end