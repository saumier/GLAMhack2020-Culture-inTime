# Class to load productions from sparql into local db
class LoadProductions

  def initialize
    @client = ArtsdataAPI::V1::Client.new()
  end

  def canada
    @data = @client.execute_sparql(SparqlLoader.load("canadian_productions"))
    puts "Canadian: dropping..."
    Production.where(country: "Canada").delete_all
    load
  end

  def swiss
    @data = @client.execute_sparql(SparqlLoader.load("swiss_productions"))
    puts "Swiss: dropping..."
    Production.where(country: "Switzerland").delete_all
    load
  end

  def data
    @data
  end

  def load
    # Production.delete_all  "country = 5 AND (category = 'Something' OR category = 'Else')"
    puts "loading..."
    productions = @data.map do |production|
      p = Production.new
      p.label = production['label']['value'] if production['label']
      p.location_label = production['venue']['value'] if production['venue']
      p.date_of_first_performance = production['start']['value'] if production['start']
      p.description = production['description']['value'].squish if production['description']
      p.main_image = production['image']['value'] if production['image']
      p.country = production['country']['value'] if production['country']
      p.locality = production['locality']['value'] if production['locality']
      p.production_uri = production['production_uri']['value'] if production['production_uri']
      p.save
      p
    end
    productions.select(&:persisted?)
  end
end