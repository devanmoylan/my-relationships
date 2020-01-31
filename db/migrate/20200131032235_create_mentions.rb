class CreateMentions < ActiveRecord::Migration[6.0]
  def change
    create_table :mentions do |t|
      t.references :mentionable, polymorphic: true
      t.references :sourceable, polymorphic: true
      t.timestamps
    end
  end
end
