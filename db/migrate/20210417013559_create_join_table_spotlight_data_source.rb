class CreateJoinTableSpotlightDataSource < ActiveRecord::Migration[5.2]
  def self.up
    create_table :data_sources_spotlights, id: false do |t|
      t.belongs_to :data_source
      t.belongs_to :spotlight
    end
  end

  def self.down
      drop_table :data_sources_spotlights
  end
end
