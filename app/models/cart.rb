class Cart < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :products
  has_many :users

  validates :user, :product, presence: :true
end
