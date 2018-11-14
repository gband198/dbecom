class Product < ApplicationRecord
	has_one_attached :image
	belongs_to :category

	before_save :format_downcase

	def self.search(search)
		c = Category.where(name: search.downcase).first
		category = if c.nil? then search else c.id end
		where("name LIKE ? OR category_id LIKE ?", "%#{search}%", "%#{category}%").order("created_at DESC")
	end


	protected
  def format_downcase
    self.name.downcase!
    self.description.downcase!
  end
end
