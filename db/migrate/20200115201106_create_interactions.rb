# frozen_string_literal: true

class CreateInteractions < ActiveRecord::Migration[6.0]
  def change
    create_table :interactions do |t|
      t.belongs_to :person, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.text :notes
      t.text :key_take_aways
      t.text :follow_ups
      t.string :location
      t.boolean :private_interaction

      t.timestamps
    end
  end
end
