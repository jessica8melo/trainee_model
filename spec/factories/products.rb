FactoryBot.define do
  sequence :product_names do |n|
    "Product #{n}"
  end
  
  factory :product do
    description { "MyString" }
    price { 1 }
    inventory { 1 }
    name { generate(:product_names)}
    brand { association :brand }
    category { association :category }
  end
end
