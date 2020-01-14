# frozen_string_literal: true

class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.integer :person_one_id
      t.integer :person_two_id

      t.timestamps
    end

    add_index :connections, %i[person_one_id person_two_id]
  end
end
