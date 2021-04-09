class CreateDataSources < ActiveRecord::Migration[5.2]
  def change
    create_table :data_sources do |t|
      t.string :name
      t.string :sparql
      t.string :email
      t.datetime :loaded

      t.timestamps
    end
  end
end
