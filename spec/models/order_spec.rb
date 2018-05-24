require 'rails_helper'
require 'rspec'

RSpec.describe Order, type: :model do
  let(:customer) { double("customer") }
  subject(:order) { Order.new(user_id: customer.id) }
  let(:item1) { double("item", name: "bell peppers", price: 1.50, order_id: order.id) }
  let(:item1) { double("item", name: "chocolate ice cream", price: 8.50, order_id: order.id) }

  it { should have_many(:items) }
  it { should belong_to(:user) }

  describe "#order_total" do
    it "adds up the prices of individual items in the order" do
      expect(order.order_total).to eq(10.00)
    end
  end
end
