class ProductSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at, :name, :price, :description, :category, :image
	include Rails.application.routes.url_helpers
def category
	object.category
end

  def image
  	"#{rails_blob_path(object.image)}" if object.image.attachment
  	#{Rails.application.routes.default_url_options[:host]}
  end
end
