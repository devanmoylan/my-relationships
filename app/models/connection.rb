class Connection < ApplicationRecord
  belongs_to :person_one, foreign_key: :person_one_id, class_name: "Person"
  belongs_to :person_two, foreign_key: :person_two_id, class_name: "Person"
end
