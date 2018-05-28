require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
  subject(:order_item_last) { OrderItem.last }
  let(:dan) { User.create(email_address: "d@gmail.com", password: "123456", first_name: "Dan") }

  describe "POST #create" do
    context "when logged in" do
      before do
        allow(controller).to receive(:current_user) { dan }
      end
      context "with valid params" do
        it "flashes success message" do
          post :create, params: {
            order_items: { order_id: 1, item_id: 1, id: 1 },
          }
          expect(flash[:now]).to be_present
        end

        it "redirects to the order show page" do
          post :create, params: { order_id: 1, item_id: 1 }
          expect(response).to redirect_to(user_order_url(current_user.id, 1))
        end
      end

      context "with invalid params" do
        it "flashes errors" do
          post :create, params: { order_id: nil, item_id: nil }
          expect(flash[:errors]).to be_present
        end
      end
    end

    context 'when logged out' do
      before do
        allow(controller).to receive(:current_user) { nil }
      end
      it "redirects to the login page" do
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

  describe "DELETE #destroy" do
    context "when logged in" do
      before do
        allow(controller).to receive(:current_user) { dan }
      end
      it "removes an item from an order" do
        delete :destroy, params: { id: OrderItem.last.id }
        expect(OrderItem.exists?(order_item_last)).to be false
      end

      it "redirects to the user order page" do
        delete :destroy, params: { id: OrderItem.last.id }
        expect(response).to redirect_to(user_order_url(current_user, order_item_last))
      end
    end

    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) { nil }
      end
      it "redirects to the login screen" do
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

end
