class OrderSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :address, :cardnum, :email, :status, :total, :created_at, :updated_at
  has_many :order_products
end
