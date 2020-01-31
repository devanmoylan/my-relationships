# frozen_string_literal: true

class Interaction < ApplicationRecord
  belongs_to :person
  belongs_to :user

  has_rich_text :notes

  has_many :reminders, as: :memorable, dependent: :destroy, inverse_of: :memorable

  accepts_nested_attributes_for :reminders, reject_if: :all_blank, allow_destroy: true
end
