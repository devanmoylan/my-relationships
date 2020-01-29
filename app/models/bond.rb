class Bond < ApplicationRecord
  has_person_name

  belongs_to :person
end
