# frozen_string_literal: true

class UserFriend < ApplicationRecord
  self.table_name = 'users_friends'

  belongs_to :friend
  belongs_to :user
end
