# Class to load productions from sparql into local db
class LoadProductions

  def initialize
    @client = ArtsdataAPI::V1::Client.new()
  end

  def query_uri(data_source, production_uri)
    sparql = data_source.sparql.gsub('PRODUCTION_URI_PLACEHOLDER', production_uri)
    @data = @client.execute_sparql(sparql)

    puts "query_uri: #{@data}"    
    return if self.error?
    
    @data[:message]
  end

  def source(data_source)
    @data = @client.execute_sparql(data_source.sparql)

    return if self.error?

    data_source.productions.delete_all
    load(data_source, @data[:message])
    data_source.loaded = Time.now
    data_source.save
  end

  def error?
    @data[:code] != 200
  end

  def errors
    return unless @data[:code] != 200
    @data[:message] 
  end

  def count
    return 0 unless @data[:code] == 200
    @data[:message].count
  end


  def load(data_source, data)
    
    puts "loading..."
    productions = data.map do |production|
      p = data_source.productions.new
      p.label = CGI.unescapeHTML(production['label']['value']) if production['label']
      p.location_label = production['venue']['value'] if production['venue']
      p.date_of_first_performance = production['start']['value'] if production['start']
      p.description = CGI.unescapeHTML(production['description']['value']).squish if production['description']
      p.main_image = production['image']['value'] if production['image']
      p.country = production['country']['value'] if production['country']
      p.locality = production['locality']['value'] if production['locality']
      p.production_uri = production['production_uri']['value'] if production['production_uri']
      p.production_company_label = production['production_company_label']['value'] if production['production_company_label']
      p.production_company_uri = production['production_company_uri']['value'] if production['production_company_uri']
      p.save
      p
    end
    productions.select(&:persisted?)
  end
end