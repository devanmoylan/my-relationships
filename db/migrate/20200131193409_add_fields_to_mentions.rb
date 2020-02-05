# frozen_string_literal: true

class AddFieldsToMentions < ActiveRecord::Migration[6.0]
  def change
    add_column :mentions, :source_person_name, :string
    add_column :mentions, :source_title, :string
    add_column :mentions, :source_path, :string
  end
end
