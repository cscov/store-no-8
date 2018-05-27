require 'rails_helper'
require 'rspec'

RSpec.describe OrdersController, type: :controller do
  authentication = User.create(email_address: "c@gmail.com", password: "123456", first_name: "carolyn")
  let(:carolyn) { authentication }
  subject(:order) { Order.create(user_id: carolyn.id) }

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

    describe "GET #new" do
      context "when logged in" do
        before do
          allow(controller).to receive(:current_user) { carolyn }
        end
        it "displays the new order page" do
          get :new, params: { user_id: User.last.id }
          expect(response).to render_template(:new)
        end
      end

      context "when logged out" do
        before do
          allow(controller).to receive(:current_user) { nil }
        end
        it "redirects to the login page" do
          get :new, params: { user_id: User.last.id }
          expect(response).to redirect_to(new_session_url)
        end
      end
    end

    describe "POST #create" do
      context "when logged in, displays the order show page" do
        before do
          allow(controller).to receive(:current_user) { carolyn }
        end
        it { should route(post,'users/1/orders/').to(actiion => :create, user_id => 1)}
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
          get :edit, params: { id: order.id, user_id: carolyn.id }
          expect(response).to render_template(:edit)
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
            delete :destroy, params: { id: order.id, user_id: carolyn.id }
            expect(response).to redirect_to(user_orders_url)
            expect(Order.exists?(order.id)).to be false
          end
        end
      end
    end

end
