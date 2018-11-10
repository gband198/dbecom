class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :createrd_at, :updated_at
  has many :products  
end
