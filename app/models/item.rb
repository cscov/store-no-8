class Item < ApplicationRecord
  validates :name, presence: true

  has_many :order_items

  has_many :orders,
           through: :order_items,
           source: :order

  monetize :price_cents #required for money-rails library

end
