class CreateSpotlights < ActiveRecord::Migration[5.2]
  def change
    create_table :spotlights do |t|
      t.string :title
      t.string :subtitle
      t.string :image
      t.string :description
      t.string :location
      t.date :start_date
      t.date :end_date
      t.string :query

      t.timestamps
    end
  end
end
