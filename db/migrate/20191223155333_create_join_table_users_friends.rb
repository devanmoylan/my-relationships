# frozen_string_literal: true

class CreateJoinTableUsersFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :users_friends, id: false do |t|
      t.bigint :user_id
      t.bigint :friend_id
    end

    add_index :users_friends, :user_id
    add_index :users_friends, :friend_id
  end
end
