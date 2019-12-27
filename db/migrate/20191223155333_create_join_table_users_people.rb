# frozen_string_literal: true

class CreateJoinTableUsersPeople < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships, id: false do |t|
      t.bigint :user_id
      t.bigint :person_id
    end

    add_index :relationships, :user_id
    add_index :relationships, :person_id
  end
end
