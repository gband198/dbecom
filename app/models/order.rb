class Order < ApplicationRecord
	has_many :order_products, dependent: :destroy
	before_save :format_downcase

	protected
  def format_downcase
    self.name.downcase!
    self.username.downcase!
    self.address.downcase!
    self.email.downcase!
  end
end
