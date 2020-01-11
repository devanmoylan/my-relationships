class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.integer :user_one_id
      t.integer :user_two_id

      t.timestamps
    end

    add_index :connections, [:user_one_id, :user_two_id]
  end
end
