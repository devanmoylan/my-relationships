# frozen_string_literal: true

class Person < ApplicationRecord
  include ActionText::Attachable

  has_person_name

  has_one_attached :avatar

  has_many :relationships, join_table: 'relationships', class_name: 'Relationship'
  has_many :users, through: :relationships

  has_many :bonds, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :interactions, dependent: :destroy
  has_many :interests, dependent: :destroy

  def age
    return nil if birthday.nil?

    ((Date.today - birthday) / 365.25).to_i
  end
end
