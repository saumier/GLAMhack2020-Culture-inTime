class DataSource < ApplicationRecord
  has_many :productions, dependent: :destroy

  has_and_belongs_to_many :spotlights
  
  has_and_belongs_to_many :layers,
    class_name: "DataSource",
    join_table: :chains, 
    foreign_key: :data_source_id, 
    association_foreign_key: :linked_data_source_id
end