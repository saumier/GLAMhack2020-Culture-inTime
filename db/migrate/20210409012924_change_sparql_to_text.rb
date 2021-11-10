class ChangeSparqlToText < ActiveRecord::Migration[5.2]
  def change
    change_column :data_sources, :sparql, :text
  end
end
