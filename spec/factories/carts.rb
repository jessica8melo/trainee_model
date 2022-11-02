FactoryBot.define do
  factory :cart do
    product { association :product }
    user { association :user }
  end
end
