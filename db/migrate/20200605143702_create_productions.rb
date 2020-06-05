class CreateProductions < ActiveRecord::Migration[5.2]
  def change
    create_table :productions do |t|
      t.string :label
      t.string :location_label
      t.string :location_uri
      t.datetime :date_of_first_performance
      t.string :production_company_uri
      t.string :production_company_label
      t.string :description
      t.string :main_image

      t.timestamps
    end
  end
end
