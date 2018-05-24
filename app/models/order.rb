class Order < ApplicationRecord
  validates :user_id, presence: true

  has_many :items
  belongs_to :user

  def order_total
    total = 0
    self.items.each do |item|
      total += item.price
    end
    total
  end

end
