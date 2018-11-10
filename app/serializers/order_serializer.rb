class OrderSerializer < ActiveModel::Serializer
  attributes :id, :name, :total, :products, :category
  def products self.object.product.map |product|{
  		name:product.name
  		category_id: product.category_id
  		category_name:category.name
  		price: product.price
  		description: product.description
  		}
  end
end
