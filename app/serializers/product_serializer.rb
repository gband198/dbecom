class ProductSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at, :name, :price, :description, :category

def category
	object.category
end

  def image
  	url_for(object.image)
  end
end
