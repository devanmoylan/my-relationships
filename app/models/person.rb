# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :relationships, join_table: 'relationships', class_name: 'Relationship'
  has_many :users, through: :relationships

  has_many :experiences

  def age
    return nil if birthday.nil?

    Date.today.year - birthday.year
  end
end
