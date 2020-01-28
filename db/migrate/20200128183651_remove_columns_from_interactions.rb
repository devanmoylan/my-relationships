# frozen_string_literal: true

class RemoveColumnsFromInteractions < ActiveRecord::Migration[6.0]
  def change
    remove_column :interactions, :notes, :text
    remove_column :interactions, :key_take_aways, :text
    remove_column :interactions, :follow_ups, :text

    add_column :experiences, :current, :boolean, default: false
  end
end
