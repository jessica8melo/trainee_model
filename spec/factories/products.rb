FactoryBot.define do
  factory :product do
    name { "MyString" }
    description { "MyString" }
    price { 1 }
    inventory { 1 }
    category { association :category }
    brand { association :brand }
  end
end
