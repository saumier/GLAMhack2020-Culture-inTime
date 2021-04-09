class AddDataSourceToProductions < ActiveRecord::Migration[5.2]
  def change
    add_reference :productions, :data_source, foreign_key: true
  end
end
