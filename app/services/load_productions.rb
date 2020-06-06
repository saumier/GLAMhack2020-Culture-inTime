# Class to load productions from sparql into local db
class LoadProductions

  def initialize
    @client = ArtsdataAPI::V1::Client.new()
    @data = @client.execute_sparql(SparqlLoader.productions)
    puts @data
  end

  def data
    @data
  end

  def load
    Production.delete_all
    #  "Production.delete_all "production_id = 5 AND (category = 'Something' OR category = 'Else')"
    productions = @data.map do |production|
      p = Production.new
      p.label = production['label']['value']
      p.location_label = production['venue']['value']
      p.date_of_first_performance = production['start']['value']
      p.description = production['description']['value'].squish
      p.main_image = production['image']['value']
      p.save
      p
    end
    productions.select(&:persisted?)
  end
end