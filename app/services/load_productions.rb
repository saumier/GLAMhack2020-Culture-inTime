# Class to load productions from sparql into local db
class LoadProductions

  def initialize
    @client = ArtsdataAPI::V1::Client.new()
    @cache_errors = []
  end

  # Used for supplementary SPARQLs on one production URI
  def query_uri(data_source, production_uri)
    sparql = data_source.sparql.gsub('PRODUCTION_URI_PLACEHOLDER', production_uri)
    @data = @client.execute_sparql(sparql)

    puts "query_uri: #{@data}"
    return if self.error?

    @data[:message]
  end

  # Drop and load Productions from SPARQL
  def source(data_source)
    @data = @client.execute_sparql(data_source.sparql)

    return if self.error?

    # Drop all productions 
    data_source.productions.delete_all

    # Load new productions
    productions_persisted = load(data_source, @data[:message])

    # Only update loaded data if some productions were saved to db
    return unless productions_persisted.count.positive?

    ds = DataSource.find(data_source.id) # needed incase there were errors. # clear_errors does not work for associations
    ds.update_attribute(:loaded, Time.now)
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

  def cache_errors
    @cache_errors
  end

  def load(data_source, data)
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
      if p.errors.present?
        @cache_errors << [p.production_uri, p.errors.messages] unless @cache_errors.count > 10 #max errors
      end
      p
    end
    productions.select(&:persisted?)
  end
end
