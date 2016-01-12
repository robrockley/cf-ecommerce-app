class Product < ActiveRecord::Base
  has_many :orders
  has_many :comments

  validates :name, :description, :image_url, :colour, :price, presence: true


  def average_rating
    comments.average(:rating).to_f
  end

end
