class CreateJoinTableChains < ActiveRecord::Migration[5.2]
  def self.up
    create_table :chains, id: false do |t|
      t.integer :data_source_id
      t.integer :linked_data_source_id
    end

    add_index(:chains, [:data_source_id, :linked_data_source_id], :unique => true)
    add_index(:chains, [:linked_data_source_id, :data_source_id], :unique => true)
  end

  def self.down
      remove_index(:chains, [:linked_data_source_id, :data_source_id])
      remove_index(:chains, [:data_source_id, :linked_data_source_id])
      drop_table :chains
  end
end
