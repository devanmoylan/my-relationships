# frozen_string_literal: true

class AddTitleToInteractions < ActiveRecord::Migration[6.0]
  def change
    add_column :interactions, :title, :string
  end
end
