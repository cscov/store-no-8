require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
  let(:dan) { User.create(email_address: "d@gmail.com", password: "123456", first_name: "Dan") }
  let(:order) { Order.create(user_id: 1) }
  let(:item) { Item.create(name: "celery") }
  subject(:order_item_last) { OrderItem.create(order_id: 1, item_id: 1) }

  describe "POST #create" do
    context "when logged in" do
      before do
        allow(controller).to receive(:current_user) { dan }
      end
        it "redirects to the order show page" do
          post :create, params: { order_id: 1, item_id: 1 }
          expect(response).to redirect_to(user_order_url(user_id: User.last.id, id: 1))
        end
      end

    context 'when logged out' do
      before do
        allow(controller).to receive(:current_user) { nil }
      end
      it "redirects to the login page" do
        post :create, params: { order_id: 1, item_id: 1 }
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

  describe "DELETE #destroy" do
    context "when logged in" do
      before do
        allow(controller).to receive(:current_user) { dan }
        OrderItem.create(order_id: 1, item_id: 1)
      end
      it "removes an item from an order" do
        order_item_last.id = 1
        delete :destroy, params: { id: order_item_last.id }
        expect(OrderItem.exists?(1)).to be false
      end

      it "redirects to the user order page" do
        delete :destroy, params: { id: order_item_last.id }
        expect(response).to redirect_to(user_order_url(user_id: User.last.id, order_id: 1))
      end
    end

    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) { nil }
      end
      it "redirects to the login screen" do
        delete :destroy, params: { id: order_item_last.id }
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

end
