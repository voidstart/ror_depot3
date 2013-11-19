class Product < ActiveRecord::Base
validates :title, :description, :image_url, presence: true
validates :price, numericality: {greater_than_or_equal_to: 0.01}
validates :title, uniqueness: true
validates :title, length: {minimum: 10,
 too_short: "Title should be longer!!" }
validates :image_url, allow_blank: true, format: {
	with: %r{\.(gif|png|jpg)$}i,
	message: 'Url must end in gif/png/jpg'
}
end
