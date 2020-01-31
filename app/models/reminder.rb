class Reminder < ApplicationRecord
  has_rich_text :description

  belongs_to :memorable, polymorphic: true, optional: false
end
