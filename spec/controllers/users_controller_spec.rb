require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #new"
    context 'with valid params'
      it "logs in the user"

    context "with invalid params"
      it "flashes errors"

end
