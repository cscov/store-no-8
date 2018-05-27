require 'rails_helper'
require 'rspec'

RSpec.describe SessionsController, type: :controller do
  describe "GET #new" do
    it "renders the login form" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it "successfully logs the user in with valid params" do
      post :create, params: {
        user: {
          email_address: "cscov@gmail.com",
          password: "123456"
        }
      }
      expect(response.status).to be(200)
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
    end

    it 'displays the login screen upon succesful log out' do
      delete :destroy
      expect(response).to render_template(:new)
    end
  end

end
