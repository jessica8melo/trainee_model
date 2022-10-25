class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  has_many :carts

  validates :name, presence: :true, uniqueness: :true
  validates :price, :category, :brand, presence: :true
end
