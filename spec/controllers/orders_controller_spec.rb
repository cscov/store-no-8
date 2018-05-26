require 'rails_helper'
require 'rspec'

RSpec.describe OrdersController, type: :controller do
  let(:carolyn) { User.first }

    describe "GET #index" do
      context "when logged in" do
        before do
          allow(controller).to receive(:current_user) { carolyn }
        end
        it "displays all orders for the current user" do
          get :index, params: { user_id: 1 }
          expect(response).to render_template(:index)
        end
      end

      context "when logged out" do
        before do
          allow(controller).to receive(:current_user) { nil }
        end
        it "redirects to the login page" do
          get :index, params: { user_id: 1 }
          expect(response).to redirect_to(new_api_session_url)
        end
      end
    end

    describe "GET #new" do
      context "when logged in" do
        before do
          allow(controller).to receive(:current_user) { carolyn }
        end
        it "displays the new order page" do
          get :new
          expect(response).to render_template(:new)
        end
      end

      context "when logged out" do
        before do
          allow(controller).to receive(:current_user) { nil }
        end
        it "redirects to the login page" do
          get :new
          expect(response).to redirect_to(new_api_session)
        end
      end
    end

    describe "POST #create" do
      context "when logged in" do
        before do
          allow(controller).to receive(:current_user) { carolyn }
        end
        it "adds a new order to the current user's list of orders" do
          order = post :create, params: {
            order: {
              user_id: 1
            }
          }
          exepct(current_user.orders).to include(order)
        end

        it "displays the order show page" do
          expect(response).to redirect_to(api_user_order_url(Order.last))
        end
      end

      context "when logged out" do
        before do
          allow(controller).to receive(:current_user) { nil }
        end
        it "redirects to the login page" do
          get :index
          expect(response).to redirect_to(new_api_session)
        end
      end
    end

    describe "GET #edit" do
      context "when logged in" do
        before do
          allow(controller).to receive(:current_user) { carolyn }
          @order = Order.create(user_id: carolyn.id)
        end
        it "displays the order to be edited" do
          get :edit, params: { id: @order.id, user_id: carolyn.id }
          expect(response).to render_template(:edit)
        end
      end
    end

    describe "DELETE #destroy" do
      context "when logged in" do
        before do
          allow(controller).to receive(:current_user) { carolyn }
          @order = Order.create(user_id: carolyn.id, order_status: "processing")
        end

        context "when order has not been completed" do
          it "deletes the currently viewed order and redirects back to the order index" do
            delete :destroy, params: { id: @order.id, user_id: carolyn.id }
            expect(response).to redirect_to(api_user_orders)
            expect(Order.exists?(@order.id)).to be false
          end
        end
      end
    end

end
