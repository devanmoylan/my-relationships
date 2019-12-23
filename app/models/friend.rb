# frozen_string_literal: true

class Friend < ApplicationRecord
  has_many :users_friends, join_table: 'users_friends', class_name: 'UserFriend'
  has_many :users, through: :users_friends
end
