class OrderSerializer < ActiveModel::Serializer
  attributes :id, :name, :total, :products, :category, :created_at, :updated_at
 has_many :order_products
end
