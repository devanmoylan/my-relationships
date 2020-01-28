# frozen_string_literal: true

class Interaction < ApplicationRecord
  belongs_to :person
  belongs_to :user

  has_rich_text :notes
end
