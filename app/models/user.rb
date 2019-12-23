# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable

  has_many :users_friends, join_table: 'users_friends', class_name: 'UserFriend'
  has_many :friends, through: :users_friends
end
