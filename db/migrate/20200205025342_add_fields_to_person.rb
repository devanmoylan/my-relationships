# frozen_string_literal: true

class AddFieldsToPerson < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :email, :string
    add_column :people, :position, :string
    add_column :people, :company, :string
  end
end
