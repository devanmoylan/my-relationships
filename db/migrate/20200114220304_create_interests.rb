# frozen_string_literal: true

class CreateInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :interests do |t|
      t.string :name
      t.integer :level
      t.belongs_to :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
