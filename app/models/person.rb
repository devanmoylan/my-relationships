# frozen_string_literal: true

class Person < ApplicationRecord
  include ActionText::Attachable

  has_many :relationships, join_table: 'relationships', class_name: 'Relationship'
  has_many :users, through: :relationships

  has_many :experiences, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :interactions, dependent: :destroy
  has_many :interests, dependent: :destroy

  # PERSON to PERSON
  has_many :person_two_connections, foreign_key: :person_two_id, class_name: 'Connection'
  has_many :connections, through: :person_two_connections, source: :person_one
  has_many :person_one_connections, foreign_key: :person_one_id, class_name: 'Connection'
  has_many :one_connections, through: :person_one_connections, source: :person_two

  # get connections both ways
  def all_connections
    (connections + one_connections).uniq
  end

  def age
    return nil if birthday.nil?

    ((Date.today - birthday) / 365.25).to_i
  end
end
