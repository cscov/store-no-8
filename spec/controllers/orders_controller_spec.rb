require 'rails_helper'
require 'byebug'

RSpec.describe OrdersController, type: :controller do
  let(:carolyn) { User.create(email_address: "c@gmail.com", password: "123456", first_name: "carolyn") }
  subject(:order) { Order.create(user_id: carolyn.id, order_status: "completed") }

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
          expect(response).to redirect_to(new_session_url)
        end
      end
    end

    describe "GET #show" do
      context "when logged in" do
        before do
          allow(controller).to receive(:current_user) { carolyn }
        end
        it "displays the current order" do
          get :show, params: { user_id: 1, id: 1}
          expect(response).to render_template(:show)
        end
      end

      context "when logged out" do
        before do
          allow(controller).to receive(:current_user) { nil }
        end
        it "redirects to the login page" do
          get :show, params: { user_id: 1, id: 1}
          expect(response).to redirect_to(new_session_url)
        end
      end
    end


    describe "POST #create" do
      context "when logged in" do
        before do
          allow(controller).to receive(:current_user) { carolyn }
        end
        it "displays the order show page" do
          post :create, params: { user_id: 1 }
          expect(response).to redirect_to(user_order_url(User.first.id, Order.last.id))
        end
      end

      context "when logged out" do
        before do
          allow(controller).to receive(:current_user) { nil }
        end
        it "redirects to the login page" do
          post :create, params: { user_id: User.last.id }
          expect(response).to redirect_to(new_session_url)
        end
      end
    end

    describe "GET #edit" do
      context "when logged in" do
        before do
          allow(controller).to receive(:current_user) { carolyn }
        end
        it "displays the order to be edited" do
          get :edit, params: { id: 1, user_id: 1 }
          expect(response).to render_template(:edit)
        end
      end

      context "when logged out" do
        before do
          allow(controller).to receive(:current_user) { nil }
        end
        it "redirects to the login page" do
          get :edit, params: {user_id: 1, id: 1}
          expect(response).to redirect_to(new_session_url)
        end
      end
    end

    describe "DELETE #destroy" do
      context "when logged in" do
        before do
          allow(controller).to receive(:current_user) { carolyn }
        end

        context "when order has not been completed" do

          it "deletes the currently viewed order and redirects back to the order index" do
            carolyn.id = 1
            order.id = 1
            delete :destroy, params: { id: Order.last.id, user_id: User.last.id}
            expect(response).to redirect_to(user_orders_url(User.last))
            expect(Order.exists?(order.id)).to be false
          end
        end
      end
    end

end
