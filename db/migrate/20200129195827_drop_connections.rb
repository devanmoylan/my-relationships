# frozen_string_literal: true

class DropConnections < ActiveRecord::Migration[6.0]
  def change
    drop_table :connections
  end
end
