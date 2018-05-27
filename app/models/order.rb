
class Order < ApplicationRecord
  validates :user_id, presence: true

  has_many :order_items

  has_many :items,
           through: :order_items,
           source: :item

  belongs_to :user

  def order_total
    total = 0.00
    self.items.each do |item|
      total += item.price
    end
    total
  end

end
