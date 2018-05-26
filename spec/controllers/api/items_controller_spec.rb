require 'rails_helper'
require 'rspec'

RSpec.describe Api::ItemsController, type: :controller do
  describe "GET #index" do
    it "displays all available items" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "displays the selected item" do
      @item = Item.create(name: "broccoli", price: 2.99)

      get :show, params: { id: @item.id }
      expect(response).to render_template(:show)

    end
  end
end
