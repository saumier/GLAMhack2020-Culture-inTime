class AddCityToProductions < ActiveRecord::Migration[5.2]
  def change
    add_column :productions, :locality, :string
  end
end
