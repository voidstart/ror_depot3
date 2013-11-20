class Product < ActiveRecord::Base
has_many :line_items
before_destroy :ensure_not_referenced_by_any_line_item
	
attr_accessible :description, :image_url, :price, :title

validates :title, :description, :image_url, presence: true
validates :price, numericality: {greater_than_or_equal_to: 0.01}
validates :title, uniqueness: true
validates :title, length: {minimum: 10,
 too_short: "Title should be longer!!" }
validates :image_url, allow_blank: true, format: {
	with: %r{\.(gif|png|jpg)$}i,
	message: 'Url must end in gif/png/jpg'
}

  private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end
