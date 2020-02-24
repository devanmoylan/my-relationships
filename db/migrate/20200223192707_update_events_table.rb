class UpdateEventsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :events

    create_table :events do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.datetime :reminder
      t.string :title
      t.string :location

      t.timestamps
    end
  end

  def down
    drop_table :events

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
