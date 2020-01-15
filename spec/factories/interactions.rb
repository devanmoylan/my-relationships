# frozen_string_literal: true

FactoryBot.define do
  factory :interaction do
    person
    user
    notes { 'MyText' }
    key_take_aways { 'MyText' }
    follow_ups { 'MyText' }
    location { 'MyString' }
    private_interaction { false }
  end
end
