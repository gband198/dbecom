class OrderSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :address, :cardnum, :email, :status, :total, :created_at, :updated_at
  has_many :order_products


  	#def total
  	#	tot = 0
  	#	 order_products.products do |order_products.products.price|
  	#		tot = tot + order_products.products.price
  	#	end
  	#end
end
