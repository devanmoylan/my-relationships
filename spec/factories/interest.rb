# frozen_string_literal: true

FactoryBot.define do
  factory :interest do
    person
    name { 'Fishing' }
    level  { 8 }
  end
end
