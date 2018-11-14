class Product < ApplicationRecord
	has_one_attached :image
	belongs_to :category

	before_save :format_downcase


	protected
  def format_downcase
    self.name.downcase!
    self.description.downcase!
  end
end
