require 'rails_helper'
require 'rspec'

RSpec.describe Api::SessionsController, type: :controller do
  it "displays the user's orders after successful login" #do
  # end
  # it "displays the user's orders after successful account creation" do
  #   user = User.create!(email_address: "test3@gmail.com", password: "123456", first_name: "Carolyn")
  #   should route('get', "api/users/#{user.id}/orders").to(action: 'index')
  # end
  it 'flashes errors on unsuccessful login'
  it 'flashes errors on unsuccessful account creation'
  it 'displays the login screen upon succesful log out'
end
