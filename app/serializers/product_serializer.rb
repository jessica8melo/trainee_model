class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :inventory

  has_one :category
  has_one :brand
end
