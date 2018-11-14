class Category < ApplicationRecord
has_many :products , dependent: :destroy

before_save :format_downcase


	protected
  def format_downcase
    self.name.downcase!
  end
end
