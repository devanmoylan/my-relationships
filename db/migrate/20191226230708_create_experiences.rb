# frozen_string_literal: true

class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.string :experience_type
      t.date :start_date
      t.date :end_date
      t.string :location
      t.text :description
      t.string :role
      t.belongs_to :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
