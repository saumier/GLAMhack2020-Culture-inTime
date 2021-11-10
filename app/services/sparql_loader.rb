# Class to load SPARQL from local files
class SparqlLoader
 
  def self.load(filename, str_to_replace = '', value = '' )
    File
      .read("app/services/sparqls/#{filename}.sparql")
      .gsub(str_to_replace, value)
  end

  def self.load_url(url, str_to_replace = '', value = '' )
    begin
      result = HTTParty.get(url)
    rescue => exception
      return { error: exception.message }
    end
    result = HTTParty.get(url)
    if result.code == 200
      result.body.gsub(str_to_replace, value)
    else
      { error: result.code, message: result.body.truncate(100).squish }
    end
  end
end