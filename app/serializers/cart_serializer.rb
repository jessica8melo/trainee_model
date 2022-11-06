class CartSerializer < ActiveModel::Serializer
  attributes :id, :product

  def product
    {id: object.product.id, name: object.product.name}
  end
end
