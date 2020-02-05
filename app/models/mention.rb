# frozen_string_literal: true

class Mention < ApplicationRecord
  has_rich_text :body

  belongs_to :mentionable, polymorphic: true
  belongs_to :sourceable, polymorphic: true
end
