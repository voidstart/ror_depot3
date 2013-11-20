class CopyPriceToLineItems < ActiveRecord::Migration
  def up
LineItem.all.each do |line|
line.price = line.product.price
end
  end

  def down
  end
end
