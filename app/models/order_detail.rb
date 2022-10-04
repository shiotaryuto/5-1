class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  def total_price
    purchase_price * amount
  end
end
