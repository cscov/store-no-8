require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

  describe "POST #create" #do
    # context 'with valid params' do
    #   it "logs in the user" do
    #     User.create(email_address: "c@gmail.com", password: "123456", first_name: "Carolyn")
    #     user = User.find_by(email_address: "c@gmail.com")
    #
    #     expect(@current_user).to eq(user)
    #   end
    # end
    context "with invalid params" do
      it "flashes errors" do
        user = User.create(email_address: "c@gmail.com", password: "123",
        first_name: "carolyn")
        expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
        expect(user.errors[:email_address]).to_not include("can't be blank")
        expect(user.errors[:first_name]).to_not include("can't be blank")
      end
    end
  end
end
