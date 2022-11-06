class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  has_many :carts, dependent: :destroy

  validates :name, presence: :true, uniqueness: :true
  validates :price, :category, :brand, :description, :inventory, presence: :true

  has_many_attached :images
end
