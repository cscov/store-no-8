
class Order < ApplicationRecord
  validates :user_id, presence: true

  has_many :items
  belongs_to :user

  def order_total
    total = 0.00
    self.items.each do |item|
      total += item.price
    end
    number_to_currency(total)
  end

end
