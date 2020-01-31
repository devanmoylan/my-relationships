class CreateReminders < ActiveRecord::Migration[6.0]
  def change
    create_table :reminders do |t|
      t.string :name
      t.datetime :date
      t.references :memorable, polymorphic: true

      t.timestamps
    end
  end
end
