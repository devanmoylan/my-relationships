# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable

  has_person_name

  has_many :events
  has_many :interactions
  has_many :relationships, join_table: 'relationships', class_name: 'Relationship'
  has_many :people, through: :relationships
end
