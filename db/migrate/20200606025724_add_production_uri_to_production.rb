class AddProductionUriToProduction < ActiveRecord::Migration[5.2]
  def change
    add_column :productions, :production_uri, :string
  end
end
