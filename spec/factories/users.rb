FactoryBot.define do
  factory :user do
    name { "MyString" }
    is_admin { false }
    email { "trainee@struct" }
    password { "123456" }

    trait :admin do
      is_admin { true }
    end
  end
end
