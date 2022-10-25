FactoryBot.define do
  factory :user do
    email { "MyString" }
    password { "MyString" }
    credit { 1 }
    cart { 1 }
    name { "MyString" }
    is_admin { false }

    trait :admin do
      is_admin { true }
    end
  end
end
