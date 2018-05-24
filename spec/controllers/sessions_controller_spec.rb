require 'rails_helper'
require 'rspec'
require 'routes'

RSpec.describe Api::SessionsController, type: :controller do
  it "displays the user's orders after successful login"
  it "displays the user's orders after successful account creation"
  it 'flashes errors on unsuccessful login'
  it 'flashes errors on unsuccessful account creation'
  it 'displays the login screen upon succesful log out'
end
