class AddLocalityToProductions < ActiveRecord::Migration[5.2]
  def change
    add_column :productions, :country, :string
  end
end
