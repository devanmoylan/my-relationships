# frozen_string_literal: true

class Interaction < ApplicationRecord
  belongs_to :person
  belongs_to :user
end
