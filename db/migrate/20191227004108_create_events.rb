# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.belongs_to :person, null: false, foreign_key: true
      t.date :date
      t.integer :duration
      t.string :role
      t.text :description
      t.string :title
      t.string :location

      t.timestamps
    end
  end
end
