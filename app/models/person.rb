# frozen_string_literal: true

class Person < ApplicationRecord
  include ActionText::Attachable

  has_one_attached :avatar
  has_person_name
  has_rich_text :notes

  has_many :relationships, join_table: 'relationships', class_name: 'Relationship'
  has_many :users, through: :relationships

  has_many :bonds, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :interactions, dependent: :destroy
  has_many :interests, dependent: :destroy
  has_many :mentions, as: :mentionable, dependent: :destroy
  has_many :reminders, as: :memorable, dependent: :destroy

  accepts_nested_attributes_for :reminders, reject_if: :all_blank, allow_destroy: true
end
