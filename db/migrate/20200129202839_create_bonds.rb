class CreateBonds < ActiveRecord::Migration[6.0]
  def change
    create_table :bonds do |t|
      t.belongs_to :person, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :relationship
      t.date :birthday, default: nil

      t.timestamps
    end
  end
end
