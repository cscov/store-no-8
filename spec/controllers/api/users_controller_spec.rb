require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  describe "GET #new" do
    it "renders the new users template" do
      get :new
      expect(response).to render_template(:new)
    end
  end
  describe "POST #create" do
    context 'with valid params' do
      it "redirects to the user's orders index on success" do
        post :create, params: {
          user: {
            email_address: "cscov@gmail.com",
            password: "123456",
            first_name: "Carolyn",
            id: 1,
          },
          order: {
            user_id: 1
          }
        }

        expect(response).to redirect_to(api_user_orders_url(43))
      end

      it "logs in the user" do
        post :create, params: {
          user: {
            email_address: "cs@gmail.com",
            password: "123456",
            first_name: "Carolyn"
          }
        }
        user = User.find_by(email_address: "cs@gmail.com")
        expect(session[:session_token]).to eq(user.session_token)
      end
    end

    context "with invalid params" do
      it "flashes errors and renders the new users template" do
        post :create, params: {
          user: {
            email_address: "c@gmail.com",
            password: "123",
            first_name: "Carolyn"
          },
          id: 1
        }

        expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
        expect(user.errors[:email_address]).to_not include("can't be blank")
        expect(user.errors[:first_name]).to_not include("can't be blank")
        expect(response).to render_template(:new)
      end
    end
  end
end
