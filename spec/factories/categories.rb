FactoryBot.define do
  sequence :category_name do |_i|
    "Categoria #{n}"
  end
  factory :category do
    name { generate(:category_name ) }
  end
end
