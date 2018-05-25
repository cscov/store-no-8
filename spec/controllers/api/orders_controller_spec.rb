require 'rails_helper'

RSpec.describe Api::OrdersController, type: :controller do

    describe "GET #index" do
      it "displays all orders for the current user"
    end

    describe "GET #new" do
      it "displays all items available to add to an order"
    end

    describe "POST #create" do
      it "adds a new order to the current user's list of orders"

      it "displays the new order in the orders index"
    end

    describe "GET #edit" do
      it "displays the order to be edited"
    end

    describe "PATCH #update" do
      it "updates the currently viewed order with the updated set of items"
    end

    describe "DELETE #destroy" do
      context "when order has not been completed" do
        it "deletes the currently viewed order"
      end
    end

end
