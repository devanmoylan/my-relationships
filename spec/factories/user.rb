# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'Devan' }
    last_name  { 'Moylan' }
    sequence(:email) { |n| "person#{n}@example.com" }
    password { 'test1234' }
    after(:create) do |user, _evaluator|
      create(:person, users: [user])
    end
  end
end
