class Order < ApplicationRecord

  validates :user_id, presence: true

  has_many :order_items

  has_many :items,
           through: :order_items,
           source: :item

  belongs_to :user

end
