require 'rails_helper'
require 'rspec'

RSpec.describe Api::SessionsController, type: :controller do
  describe "GET #new" do
    it "renders the login form" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it "displays the user's orders after successful login" do
      post :create, params: {
        user: {
          email_address: "cscov@gmail.com",
          password: "123456"
        }
      }
      expect(response).to redirect_to(api_user_orders_url)
    end

    it 'flashes errors on unsuccessful login' do
      post :create, params: {
        user: {
          email_address: "b@gmail.com",
          password: "123456"
        }
      }
      expect(flash[:errors]).to be_present
      expect(response).to render_template(:new)
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      post :create, params: {
        user: {
          email_address: "cscov@gmail.com",
          password: "123456"
        }
      }
      @session_token = User.find_by(email_address: "cscov@gmail.com")
    end
    it "logs the user out" do
      delete :destroy
      expect(session[:session_token]).to be_nil

      carolyn = User.find_by(email_address: "cscov@gmail.com")
      expect(@session_token).not_to eq(carolyn.session_token)
    end

    it 'displays the login screen upon succesful log out' do
      delete :destroy
      expect(response).to render_template(:new)
    end
  end

end
