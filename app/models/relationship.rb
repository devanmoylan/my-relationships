# frozen_string_literal: true

class Relationship < ApplicationRecord
  self.table_name = 'relationships'

  belongs_to :person
  belongs_to :user
end
