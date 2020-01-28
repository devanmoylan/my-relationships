# frozen_string_literal: true

class Interaction < ApplicationRecord
  belongs_to :person
  belongs_to :user

  has_rich_text :notes
  has_rich_text :key_take_aways
  has_rich_text :follow_ups
end
