FactoryBot.define do
  factory :bond do
    person { nil }
    first_name { "MyString" }
    last_name { "MyString" }
    relationship { "MyString" }
    birthday { "2020-01-29" }
  end
end
