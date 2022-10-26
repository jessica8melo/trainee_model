FactoryBot.define do
  sequence :brand_name do |n|
    "Marca #{n}"
  end
  factory :brand do
    name { generate(:brand_name ) }
  end
end
