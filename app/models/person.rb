# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :relationships, join_table: 'relationships', class_name: 'Relationship'
  has_many :users, through: :relationships

  has_many :experiences
  has_many :events

  # PERSON to PERSON
  has_many :person_one_connnections, foreign_key: :person_one_id, class_name: "Connection"
  has_many :one_connnections, through: :person_one_connnections, source: :person_one

  has_many :person_two_connnections, foreign_key: :person_two_id, class_name: "Connection"
  has_many :two_connnections, through: :person_two_connnections, source: :person_two

  def age
    return nil if birthday.nil?

    Date.today.year - birthday.year
  end
end
